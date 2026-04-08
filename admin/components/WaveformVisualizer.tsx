'use client';

import {
  useEffect,
  useRef,
  useCallback,
  forwardRef,
  useImperativeHandle,
} from 'react';

export interface WaveformVisualizerHandle {
  /** Start capturing from the given MediaStream. */
  start: (stream: MediaStream) => void;
  /** Stop capturing and clear the canvas. */
  stop: () => void;
}

interface WaveformVisualizerProps {
  /** Width of the canvas in CSS pixels (default 600). */
  width?: number;
  /** Height of the canvas in CSS pixels (default 80). */
  height?: number;
  /** Waveform bar / line colour (default #1A73E8). */
  color?: string;
  /** Background fill (default transparent). */
  background?: string;
  /** Visual style: 'bars' draws frequency bars, 'wave' draws a time-domain oscilloscope (default 'bars'). */
  mode?: 'bars' | 'wave';
  className?: string;
}

/**
 * WaveformVisualizer
 *
 * A canvas-based audio visualizer that reads from a MediaStream (microphone).
 * Render it next to recording controls in a lesson detail page, then call
 * `ref.start(stream)` when recording begins and `ref.stop()` when it ends.
 *
 * Usage:
 * ```tsx
 * const vizRef = useRef<WaveformVisualizerHandle>(null);
 *
 * // When user presses Record:
 * const stream = await navigator.mediaDevices.getUserMedia({ audio: true });
 * vizRef.current?.start(stream);
 *
 * // When user stops:
 * vizRef.current?.stop();
 * ```
 */
const WaveformVisualizer = forwardRef<
  WaveformVisualizerHandle,
  WaveformVisualizerProps
>(function WaveformVisualizer(
  {
    width = 600,
    height = 80,
    color = '#1A73E8',
    background = 'transparent',
    mode = 'bars',
    className,
  },
  ref
) {
  const canvasRef = useRef<HTMLCanvasElement>(null);
  const rafRef = useRef<number | null>(null);
  const analyserRef = useRef<AnalyserNode | null>(null);
  const audioCtxRef = useRef<AudioContext | null>(null);
  const sourceRef = useRef<MediaStreamAudioSourceNode | null>(null);

  const cancelAnimation = useCallback(() => {
    if (rafRef.current !== null) {
      cancelAnimationFrame(rafRef.current);
      rafRef.current = null;
    }
  }, []);

  const clearCanvas = useCallback(() => {
    const canvas = canvasRef.current;
    if (!canvas) return;
    const ctx = canvas.getContext('2d');
    if (!ctx) return;
    ctx.clearRect(0, 0, canvas.width, canvas.height);
  }, []);

  const drawBars = useCallback(
    (analyser: AnalyserNode) => {
      const canvas = canvasRef.current;
      if (!canvas) return;
      const ctx = canvas.getContext('2d');
      if (!ctx) return;

      const bufferLength = analyser.frequencyBinCount;
      const dataArray = new Uint8Array(bufferLength);

      const draw = () => {
        rafRef.current = requestAnimationFrame(draw);
        analyser.getByteFrequencyData(dataArray);

        ctx.clearRect(0, 0, canvas.width, canvas.height);
        if (background !== 'transparent') {
          ctx.fillStyle = background;
          ctx.fillRect(0, 0, canvas.width, canvas.height);
        }

        const barWidth = (canvas.width / bufferLength) * 2.5;
        let x = 0;

        for (let i = 0; i < bufferLength; i++) {
          const barHeight = (dataArray[i] / 255) * canvas.height;
          const alpha = 0.5 + (dataArray[i] / 255) * 0.5;

          ctx.fillStyle = color;
          ctx.globalAlpha = alpha;
          ctx.fillRect(
            x,
            canvas.height - barHeight,
            barWidth,
            barHeight
          );
          x += barWidth + 1;
          if (x > canvas.width) break;
        }
        ctx.globalAlpha = 1;
      };

      draw();
    },
    [background, color]
  );

  const drawWave = useCallback(
    (analyser: AnalyserNode) => {
      const canvas = canvasRef.current;
      if (!canvas) return;
      const ctx = canvas.getContext('2d');
      if (!ctx) return;

      const bufferLength = analyser.fftSize;
      const dataArray = new Uint8Array(bufferLength);

      const draw = () => {
        rafRef.current = requestAnimationFrame(draw);
        analyser.getByteTimeDomainData(dataArray);

        ctx.clearRect(0, 0, canvas.width, canvas.height);
        if (background !== 'transparent') {
          ctx.fillStyle = background;
          ctx.fillRect(0, 0, canvas.width, canvas.height);
        }

        ctx.lineWidth = 2;
        ctx.strokeStyle = color;
        ctx.beginPath();

        const sliceWidth = canvas.width / bufferLength;
        let x = 0;

        for (let i = 0; i < bufferLength; i++) {
          const v = dataArray[i] / 128.0;
          const y = (v * canvas.height) / 2;

          if (i === 0) {
            ctx.moveTo(x, y);
          } else {
            ctx.lineTo(x, y);
          }
          x += sliceWidth;
        }

        ctx.lineTo(canvas.width, canvas.height / 2);
        ctx.stroke();
      };

      draw();
    },
    [background, color]
  );

  useImperativeHandle(
    ref,
    () => ({
      start(stream: MediaStream) {
        cancelAnimation();

        const audioCtx = new AudioContext();
        audioCtxRef.current = audioCtx;

        const source = audioCtx.createMediaStreamSource(stream);
        sourceRef.current = source;

        const analyser = audioCtx.createAnalyser();
        analyser.fftSize = mode === 'bars' ? 256 : 2048;
        analyser.smoothingTimeConstant = 0.8;
        analyserRef.current = analyser;

        source.connect(analyser);

        if (mode === 'bars') {
          drawBars(analyser);
        } else {
          drawWave(analyser);
        }
      },

      stop() {
        cancelAnimation();
        sourceRef.current?.disconnect();
        audioCtxRef.current?.close().catch(() => {});
        analyserRef.current = null;
        sourceRef.current = null;
        audioCtxRef.current = null;
        clearCanvas();
      },
    }),
    [mode, cancelAnimation, clearCanvas, drawBars, drawWave]
  );

  // Clean up on unmount
  useEffect(() => {
    return () => {
      cancelAnimation();
      sourceRef.current?.disconnect();
      audioCtxRef.current?.close().catch(() => {});
    };
  }, [cancelAnimation]);

  return (
    <canvas
      ref={canvasRef}
      width={width}
      height={height}
      className={className}
      style={{
        display: 'block',
        background: background === 'transparent' ? undefined : background,
        borderRadius: 8,
      }}
      aria-label="Audio waveform visualizer"
      role="img"
    />
  );
});

export default WaveformVisualizer;
