'use client';

import { useRef, useState, useCallback } from 'react';
import WaveformVisualizer, {
  WaveformVisualizerHandle,
} from '../../../components/WaveformVisualizer';

interface LessonDetailPageProps {
  params: { lessonId: string };
}

type RecordingState = 'idle' | 'requesting' | 'recording' | 'stopped';

/**
 * Lesson Detail — Admin CMS
 *
 * Shows lesson metadata, step list, and recording controls with a live
 * audio waveform visualizer.  Admins can record a pronunciation sample
 * directly in the browser to attach as a reference audio asset.
 */
export default function LessonDetailPage({ params }: LessonDetailPageProps) {
  const { lessonId } = params;
  const vizRef = useRef<WaveformVisualizerHandle>(null);
  const mediaRecorderRef = useRef<MediaRecorder | null>(null);
  const chunksRef = useRef<Blob[]>([]);
  const streamRef = useRef<MediaStream | null>(null);

  const [recordingState, setRecordingState] = useState<RecordingState>('idle');
  const [audioUrl, setAudioUrl] = useState<string | null>(null);
  const [errorMsg, setErrorMsg] = useState<string | null>(null);
  const [visualizerMode, setVisualizerMode] = useState<'bars' | 'wave'>('bars');

  const startRecording = useCallback(async () => {
    setErrorMsg(null);
    setAudioUrl(null);
    setRecordingState('requesting');

    let stream: MediaStream;
    try {
      stream = await navigator.mediaDevices.getUserMedia({ audio: true });
    } catch {
      setErrorMsg('Microphone permission denied or not available.');
      setRecordingState('idle');
      return;
    }

    streamRef.current = stream;
    vizRef.current?.start(stream);

    const recorder = new MediaRecorder(stream);
    mediaRecorderRef.current = recorder;
    chunksRef.current = [];

    recorder.ondataavailable = (e) => {
      if (e.data.size > 0) chunksRef.current.push(e.data);
    };

    recorder.onstop = () => {
      const blob = new Blob(chunksRef.current, { type: 'audio/webm' });
      setAudioUrl(URL.createObjectURL(blob));
    };

    recorder.start();
    setRecordingState('recording');
  }, []);

  const stopRecording = useCallback(() => {
    mediaRecorderRef.current?.stop();
    streamRef.current?.getTracks().forEach((t) => t.stop());
    vizRef.current?.stop();
    setRecordingState('stopped');
  }, []);

  const resetRecording = useCallback(() => {
    if (audioUrl) URL.revokeObjectURL(audioUrl);
    setAudioUrl(null);
    setRecordingState('idle');
    setErrorMsg(null);
  }, [audioUrl]);

  return (
    <div style={{ maxWidth: 800, margin: '0 auto', padding: '2rem 1.5rem' }}>
      {/* ── Header ── */}
      <div style={{ marginBottom: '2rem' }}>
        <p style={{ color: '#1A73E8', fontWeight: 600, marginBottom: 4 }}>
          Lessons / {lessonId}
        </p>
        <h1 style={{ fontSize: '1.75rem', fontWeight: 700, margin: 0 }}>
          Lesson Detail
        </h1>
      </div>

      {/* ── Lesson metadata placeholder ── */}
      <section
        style={{
          background: '#F8F9FA',
          borderRadius: 12,
          padding: '1.25rem',
          marginBottom: '2rem',
        }}
      >
        <h2 style={{ fontSize: '1rem', fontWeight: 600, marginBottom: 8 }}>
          Metadata
        </h2>
        <p style={{ color: '#5F6368', fontSize: '0.875rem' }}>
          Lesson ID: <strong>{lessonId}</strong> — fetch and display full lesson
          document here.
        </p>
      </section>

      {/* ── Recording Controls + Waveform ── */}
      <section
        style={{
          background: '#fff',
          border: '1px solid #DADCE0',
          borderRadius: 12,
          padding: '1.5rem',
          marginBottom: '2rem',
        }}
      >
        <h2 style={{ fontSize: '1rem', fontWeight: 600, marginBottom: 4 }}>
          Reference Audio Recording
        </h2>
        <p style={{ color: '#5F6368', fontSize: '0.875rem', marginBottom: 16 }}>
          Record a pronunciation reference directly in the browser, then attach
          it as an audio asset for this lesson.
        </p>

        {/* Waveform */}
        <div
          style={{
            background: '#F0F4FF',
            borderRadius: 8,
            padding: '12px',
            marginBottom: 16,
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            minHeight: 104,
          }}
        >
          <WaveformVisualizer
            ref={vizRef}
            width={560}
            height={80}
            color={recordingState === 'recording' ? '#EA4335' : '#1A73E8'}
            background="transparent"
            mode={visualizerMode}
          />
        </div>

        {/* Visualizer mode toggle */}
        <div style={{ display: 'flex', gap: 8, marginBottom: 16 }}>
          {(['bars', 'wave'] as const).map((m) => (
            <button
              key={m}
              onClick={() => setVisualizerMode(m)}
              style={{
                padding: '4px 12px',
                borderRadius: 20,
                border: '1px solid',
                borderColor: visualizerMode === m ? '#1A73E8' : '#DADCE0',
                background: visualizerMode === m ? '#E8F0FE' : '#fff',
                color: visualizerMode === m ? '#1A73E8' : '#5F6368',
                fontSize: '0.8125rem',
                fontWeight: 500,
                cursor: 'pointer',
              }}
            >
              {m === 'bars' ? 'Frequency bars' : 'Waveform'}
            </button>
          ))}
        </div>

        {/* Controls */}
        <div style={{ display: 'flex', gap: 12, flexWrap: 'wrap' }}>
          {recordingState === 'idle' && (
            <button
              onClick={startRecording}
              style={primaryButtonStyle('#EA4335')}
            >
              ⏺ Start Recording
            </button>
          )}

          {recordingState === 'requesting' && (
            <button disabled style={primaryButtonStyle('#9AA0A6')}>
              Requesting mic…
            </button>
          )}

          {recordingState === 'recording' && (
            <button
              onClick={stopRecording}
              style={primaryButtonStyle('#5F6368')}
            >
              ⏹ Stop Recording
            </button>
          )}

          {recordingState === 'stopped' && (
            <>
              <button
                onClick={resetRecording}
                style={outlineButtonStyle}
              >
                🔄 Re-record
              </button>
              {audioUrl && (
                <a
                  href={audioUrl}
                  download={`lesson-${lessonId}-reference.webm`}
                  style={primaryButtonStyle('#34A853')}
                >
                  ⬇ Download
                </a>
              )}
            </>
          )}
        </div>

        {/* Playback */}
        {audioUrl && (
          <div style={{ marginTop: 16 }}>
            <p
              style={{
                fontSize: '0.8125rem',
                color: '#34A853',
                fontWeight: 600,
                marginBottom: 6,
              }}
            >
              Recording complete — preview below:
            </p>
            <audio
              controls
              src={audioUrl}
              style={{ width: '100%' }}
              aria-label="Recorded pronunciation audio preview"
            >
              <track kind="captions" src="" label="No captions available" />
            </audio>
          </div>
        )}

        {errorMsg && (
          <p
            style={{
              marginTop: 12,
              color: '#EA4335',
              fontSize: '0.875rem',
            }}
          >
            ⚠ {errorMsg}
          </p>
        )}
      </section>

      {/* ── Steps placeholder ── */}
      <section>
        <h2 style={{ fontSize: '1rem', fontWeight: 600, marginBottom: 12 }}>
          Steps
        </h2>
        <div
          style={{
            background: '#F8F9FA',
            borderRadius: 12,
            padding: '1.25rem',
            color: '#5F6368',
            fontSize: '0.875rem',
          }}
        >
          Fetch and render lesson steps here. Each step card will include
          its own audio asset picker.
        </div>
      </section>
    </div>
  );
}

// ── Inline style helpers ───────────────────────────────────────────────────

function primaryButtonStyle(bg: string): React.CSSProperties {
  return {
    padding: '8px 20px',
    borderRadius: 8,
    border: 'none',
    background: bg,
    color: '#fff',
    fontWeight: 600,
    fontSize: '0.875rem',
    cursor: 'pointer',
    textDecoration: 'none',
    display: 'inline-flex',
    alignItems: 'center',
    gap: 4,
  };
}

const outlineButtonStyle: React.CSSProperties = {
  padding: '8px 20px',
  borderRadius: 8,
  border: '1px solid #DADCE0',
  background: '#fff',
  color: '#5F6368',
  fontWeight: 600,
  fontSize: '0.875rem',
  cursor: 'pointer',
};
