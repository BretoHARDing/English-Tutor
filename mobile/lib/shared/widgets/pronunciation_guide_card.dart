import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// ── Data model ────────────────────────────────────────────────────────────

/// One step in the mouth/tongue articulation guide, narrated in Thai.
class ArticulationStep {
  const ArticulationStep({
    required this.title,
    required this.description,
    required this.icon,
    this.tip = '',
  });

  /// Short Thai label, e.g. "ตำแหน่งลิ้น"
  final String title;

  /// Detailed Thai description of the articulation.
  final String description;

  /// Icon representing the step.
  final IconData icon;

  /// Optional extra tip for Thai speakers.
  final String tip;
}

/// Full pronunciation guide for one English sound.
class SoundGuideData {
  const SoundGuideData({
    required this.soundId,
    required this.ipaSymbol,
    required this.thaiName,
    required this.videoUrl,
    required this.thaiNarration,
    required this.articulationSteps,
    required this.commonMistake,
    required this.practiceWords,
  });

  final String soundId;

  /// e.g. '/θ/'
  final String ipaSymbol;

  /// e.g. 'เสียง TH ไม่ก้อง'
  final String thaiName;

  /// Firebase Storage URL or YouTube embed URL for the mouth-movement video.
  final String videoUrl;

  /// Full Thai narration shown below the video (replaces subtitles for now).
  final String thaiNarration;

  final List<ArticulationStep> articulationSteps;

  /// The most common mistake Thai speakers make, in Thai.
  final String commonMistake;

  /// Words to practice for this sound.
  final List<String> practiceWords;
}

// ── Detailed guide data for key problem sounds ────────────────────────────

const Map<String, SoundGuideData> kSoundGuides = {
  'th_unvoiced': SoundGuideData(
    soundId: 'th_unvoiced',
    ipaSymbol: '/θ/',
    thaiName: 'เสียง TH ไม่ก้อง',
    videoUrl: '',
    thaiNarration:
        'เสียง /θ/ เป็นเสียงที่ไม่มีในภาษาไทย '
        'แต่คุณทำได้! เพียงแค่วางลิ้นระหว่างฟันบนและล่าง '
        'แล้วเป่าลมออกมาเบาๆ ลิ้นต้องแตะฟันบน '
        'ไม่ใช่แค่ใกล้ฟัน แต่แตะจริงๆ',
    articulationSteps: [
      ArticulationStep(
        title: 'ตำแหน่งลิ้น',
        description:
            'วางปลายลิ้นให้แตะด้านในของฟันบน หรือยื่นออกมาเล็กน้อยระหว่างฟันบนและล่าง ลิ้นต้องสัมผัสฟัน',
        icon: Icons.arrow_upward_rounded,
        tip: 'ลองกัดลิ้นเบาๆ นั่นคือตำแหน่งที่ถูกต้อง!',
      ),
      ArticulationStep(
        title: 'ฟันบนและล่าง',
        description:
            'ฟันบนวางทับหรือสัมผัสกับลิ้น ฟันล่างอยู่ด้านล่างเล็กน้อย ปากอ้าพอประมาณ ไม่กว้างและไม่แคบเกิน',
        icon: Icons.drag_indicator_rounded,
        tip: 'มองกระจก — คุณควรเห็นปลายลิ้นระหว่างฟัน',
      ),
      ArticulationStep(
        title: 'รูปริมฝีปาก',
        description:
            'ริมฝีปากเปิดออกเล็กน้อยเพื่อให้เห็นฟัน ไม่ยืดออกและไม่ห่อเข้า แค่ผ่อนคลายตามธรรมชาติ',
        icon: Icons.face_rounded,
        tip: 'ริมฝีปากไม่ต้องออกแรง แค่ผ่อนคลายไว้',
      ),
      ArticulationStep(
        title: 'การเป่าลม',
        description:
            'เป่าลมออกจากระหว่างลิ้นกับฟัน จะได้ยินเสียงเสียดสีเบาๆ เหมือนเสียงลมผ่านใบไม้ ไม่ใช่เสียงดังหรือเสียงฟี้',
        icon: Icons.air_rounded,
        tip: 'วางมือหน้าปาก คุณควรรู้สึกลมอุ่นๆ พัดมาที่มือ',
      ),
    ],
    commonMistake:
        '⚠️ คนไทยมักออกเสียง /θ/ เป็น /ส/ หรือ /ต/ เช่น "think" กลายเป็น "สิงก์" '
        'จำไว้: ลิ้นต้องสัมผัสฟัน ไม่ใช่อยู่ด้านหลังฟัน',
    practiceWords: ['think', 'three', 'thank you', 'thin', 'Thursday'],
  ),

  'th_voiced': SoundGuideData(
    soundId: 'th_voiced',
    ipaSymbol: '/ð/',
    thaiName: 'เสียง TH ก้อง',
    videoUrl: '',
    thaiNarration:
        'เสียง /ð/ เหมือน /θ/ แต่มีการสั่นสะเทือนของกล่องเสียง '
        'วางลิ้นในตำแหน่งเดียวกัน แล้วเปล่งเสียงออกมา '
        'ลองวางมือที่ลำคอ — คุณควรรู้สึกสั่นสะเทือน',
    articulationSteps: [
      ArticulationStep(
        title: 'ตำแหน่งลิ้น',
        description:
            'เหมือนกับ /θ/ ทุกประการ — วางปลายลิ้นระหว่างฟันบนและล่าง',
        icon: Icons.arrow_upward_rounded,
        tip: 'ตำแหน่งลิ้นเหมือน /θ/ แต่เพิ่มเสียงก้อง',
      ),
      ArticulationStep(
        title: 'การก้องเสียง',
        description:
            'เปล่งเสียงออกมาพร้อมกับเป่าลม กล่องเสียงจะสั่นสะเทือน '
            'ลองร้องเสียง "อา" แล้วค่อยๆ ยกลิ้นขึ้นมาระหว่างฟัน',
        icon: Icons.graphic_eq_rounded,
        tip: 'วางนิ้วที่ลำคอ — ถ้ารู้สึกสั่น แสดงว่าถูกต้องแล้ว! 🎉',
      ),
      ArticulationStep(
        title: 'รูปปากและฟัน',
        description: 'เหมือนกับ /θ/ — ปากอ้าเล็กน้อย ริมฝีปากผ่อนคลาย',
        icon: Icons.face_rounded,
      ),
    ],
    commonMistake:
        '⚠️ "the", "this", "that" มักถูกออกเสียงเป็น /ด/ หรือ /ซ/ '
        'จำไว้: ลิ้นต้องออกมาระหว่างฟัน + มีเสียงก้อง',
    practiceWords: ['the', 'this', 'that', 'there', 'them', 'those'],
  ),

  'v': SoundGuideData(
    soundId: 'v',
    ipaSymbol: '/v/',
    thaiName: 'เสียง V',
    videoUrl: '',
    thaiNarration:
        'เสียง /v/ ต่างจาก /w/ และ /ฝ/ ชัดเจน '
        'ฟันบนต้องกดลงบนริมฝีปากล่าง แล้วเป่าลมออกพร้อมเสียงก้อง '
        'นี่คือเสียงที่ทำให้ "very" ต่างจาก "wery"',
    articulationSteps: [
      ArticulationStep(
        title: 'ตำแหน่งฟันบน',
        description:
            'ฟันบนกดลงบนริมฝีปากล่างเบาๆ ไม่ต้องกดแรง แค่สัมผัสกัน '
            'ริมฝีปากล่างอยู่ใต้ฟันบน',
        icon: Icons.vertical_align_bottom_rounded,
        tip: 'มองกระจก — คุณควรเห็นฟันบนอยู่บนริมฝีปากล่าง',
      ),
      ArticulationStep(
        title: 'การเป่าลมและก้องเสียง',
        description:
            'เป่าลมออกจากระหว่างฟันบนและริมฝีปากล่าง พร้อมกับเปล่งเสียงก้อง '
            'จะได้ยินเสียงสั่นสะเทือนที่ริมฝีปาก',
        icon: Icons.air_rounded,
        tip: 'วางนิ้วที่ริมฝีปากล่าง — คุณควรรู้สึกการสั่นสะเทือน',
      ),
      ArticulationStep(
        title: 'ความแตกต่างจาก /w/',
        description:
            '/w/ ทำด้วยการห่อริมฝีปากทั้งสองข้าง ส่วน /v/ ต้องการฟันบนกดริมฝีปากล่าง '
            'ทดสอบ: "vine" กับ "wine" — ฟังความต่าง',
        icon: Icons.compare_arrows_rounded,
        tip: '"vine" = ฟันบนกดริมฝีปากล่าง | "wine" = ห่อริมฝีปาก',
      ),
    ],
    commonMistake:
        '⚠️ คนไทยมักออกเสียง /v/ เป็น /w/ เช่น "very" → "wery" '
        'จำไว้: ฟันบนต้องสัมผัสริมฝีปากล่าง!',
    practiceWords: ['very', 'video', 'visit', 'voice', 'value'],
  ),

  'r': SoundGuideData(
    soundId: 'r',
    ipaSymbol: '/r/',
    thaiName: 'เสียง R (อเมริกัน)',
    videoUrl: '',
    thaiNarration:
        'เสียง /r/ ในภาษาอังกฤษอเมริกันไม่ใช่การสั่นลิ้นแบบภาษาไทย '
        'ลิ้นม้วนขึ้นด้านหลังและไม่สัมผัสส่วนใดของปาก '
        'ริมฝีปากห่อเล็กน้อย เหมือนจะพูดว่า "โอ" แต่ลิ้นม้วนขึ้น',
    articulationSteps: [
      ArticulationStep(
        title: 'การม้วนลิ้น',
        description:
            'ยกปลายลิ้นขึ้นสูงในปาก แต่ไม่สัมผัสเพดานปาก '
            'ลิ้นม้วนขึ้นและถอยไปด้านหลังเล็กน้อย เหมือนดูดนิ้ว',
        icon: Icons.undo_rounded,
        tip: '🚫 อย่าสั่นลิ้นเหมือนในภาษาไทย! ลิ้นต้องม้วนขึ้นและนิ่ง',
      ),
      ArticulationStep(
        title: 'รูปริมฝีปาก',
        description:
            'ห่อริมฝีปากเข้าเล็กน้อย คล้ายกับจะพูด "โอ" แต่ไม่กลมมากนัก '
            'แก้มเกร็งเล็กน้อยที่ด้านข้าง',
        icon: Icons.circle_outlined,
        tip: 'ลองพูด "โอ" แล้วค่อยๆ ม้วนลิ้นขึ้น — นั่นคือเสียง /r/!',
      ),
      ArticulationStep(
        title: 'เพดานปาก',
        description:
            'ปลายลิ้นชี้ขึ้นหาเพดานปากส่วนกลาง-หลัง แต่ยังมีช่องว่าง '
            'ลมผ่านด้านข้างลิ้นและออกมาข้างหน้า',
        icon: Icons.architecture_rounded,
        tip: 'คิดว่ากำลังดูดช้อน — ลิ้นม้วนขึ้นแต่ไม่แตะอะไร',
      ),
    ],
    commonMistake:
        '⚠️ คนไทยมักออกเสียง /r/ เหมือนเสียง /ร/ ในภาษาไทย (สั่นลิ้น) '
        'หรือออกเป็น /ล/ จำไว้: ลิ้นม้วนขึ้น ไม่สั่น ไม่แตะ',
    practiceWords: ['right', 'ready', 'red', 'run', 'rice', 'road'],
  ),

  'l': SoundGuideData(
    soundId: 'l',
    ipaSymbol: '/l/',
    thaiName: 'เสียง L',
    videoUrl: '',
    thaiNarration:
        'เสียง /l/ ต้องให้ปลายลิ้นแตะเพดานปากด้านหน้า ด้านหลังฟันบน '
        'แตกต่างจาก /r/ ที่ลิ้นม้วนขึ้นและไม่แตะ '
        'ลม /l/ ออกด้านข้างของลิ้น',
    articulationSteps: [
      ArticulationStep(
        title: 'ตำแหน่งลิ้น',
        description:
            'วางปลายลิ้นให้แตะเพดานปากด้านหน้า ตรงตำแหน่งด้านหลังของฟันบน '
            'ที่เรียกว่า "alveolar ridge" ลิ้นแตะตรงนั้น',
        icon: Icons.touch_app_rounded,
        tip: 'ลองพูด "ล" ในภาษาไทย — ตำแหน่งลิ้นใกล้เคียงกัน!',
      ),
      ArticulationStep(
        title: 'ทิศทางลม',
        description:
            'ลมไม่ได้ออกตรงหน้า แต่ออกด้านข้างของลิ้น ตรงที่ลิ้นไม่ได้ปิดช่อง '
            'ลองรู้สึกลมที่ด้านข้างของลิ้น',
        icon: Icons.compare_arrows_rounded,
        tip: 'เสียง /l/ มีลมออกด้านข้าง ต่างจาก /น/ ที่ลมออกทางจมูก',
      ),
    ],
    commonMistake:
        '⚠️ คนไทยมักสับสน /l/ กับ /r/ หรือ /น/ '
        'จำไว้: /l/ = ลิ้นแตะเพดาน + ลมออกด้านข้าง',
    practiceWords: ['like', 'love', 'light', 'look', 'long'],
  ),
};

// ── Video guide card widget ────────────────────────────────────────────────

/// Full pronunciation guide card with embedded video + Thai narration.
/// Shows the video of mouth/tongue movements, step-by-step articulation
/// instructions in Thai, common mistakes, and practice words.
class PronunciationGuideCard extends StatefulWidget {
  const PronunciationGuideCard({
    super.key,
    required this.guide,
    this.showPracticeWords = true,
  });

  final SoundGuideData guide;
  final bool showPracticeWords;

  @override
  State<PronunciationGuideCard> createState() => _PronunciationGuideCardState();
}

class _PronunciationGuideCardState extends State<PronunciationGuideCard> {
  VideoPlayerController? _videoController;
  bool _videoReady = false;
  bool _videoPlaying = false;

  @override
  void initState() {
    super.initState();
    _initVideo();
  }

  Future<void> _initVideo() async {
    final url = widget.guide.videoUrl;
    if (url.isEmpty) return; // Demo mode — no video yet

    final controller = VideoPlayerController.networkUrl(Uri.parse(url));
    _videoController = controller;
    try {
      await controller.initialize();
      controller.addListener(_onVideoUpdate);
      if (mounted) setState(() => _videoReady = true);
    } catch (_) {
      // Video unavailable — fall back to static guide
    }
  }

  void _onVideoUpdate() {
    if (!mounted) return;
    final playing = _videoController?.value.isPlaying ?? false;
    if (playing != _videoPlaying) {
      setState(() => _videoPlaying = playing);
    }
  }

  void _togglePlay() {
    final c = _videoController;
    if (c == null) return;
    if (c.value.isPlaying) {
      c.pause();
    } else {
      if (c.value.position >= c.value.duration) {
        c.seekTo(Duration.zero);
      }
      c.play();
    }
  }

  @override
  void dispose() {
    _videoController?.removeListener(_onVideoUpdate);
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Video section
        _VideoSection(
          videoController: _videoController,
          videoReady: _videoReady,
          isPlaying: _videoPlaying,
          ipaSymbol: widget.guide.ipaSymbol,
          thaiName: widget.guide.thaiName,
          onTogglePlay: _togglePlay,
        ),
        const SizedBox(height: 20),

        // Thai narration
        _NarrationCard(narration: widget.guide.thaiNarration),
        const SizedBox(height: 16),

        // Articulation steps
        _ArticulationSteps(steps: widget.guide.articulationSteps),
        const SizedBox(height: 16),

        // Common mistake warning
        _CommonMistakeCard(mistake: widget.guide.commonMistake),
        const SizedBox(height: 16),

        // Practice words
        if (widget.showPracticeWords)
          _PracticeWordsCard(words: widget.guide.practiceWords),
      ],
    );
  }
}

// ── Video section ─────────────────────────────────────────────────────────

class _VideoSection extends StatelessWidget {
  const _VideoSection({
    required this.videoController,
    required this.videoReady,
    required this.isPlaying,
    required this.ipaSymbol,
    required this.thaiName,
    required this.onTogglePlay,
  });

  final VideoPlayerController? videoController;
  final bool videoReady;
  final bool isPlaying;
  final String ipaSymbol;
  final String thaiName;
  final VoidCallback onTogglePlay;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: videoReady && videoController != null
            ? _VideoPlayer(
                controller: videoController!,
                isPlaying: isPlaying,
                onToggle: onTogglePlay,
              )
            : _VideoPlaceholder(
                ipaSymbol: ipaSymbol,
                thaiName: thaiName,
              ),
      ),
    );
  }
}

class _VideoPlayer extends StatelessWidget {
  const _VideoPlayer({
    required this.controller,
    required this.isPlaying,
    required this.onToggle,
  });

  final VideoPlayerController controller;
  final bool isPlaying;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        VideoPlayer(controller),
        // Progress bar
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: VideoProgressIndicator(
            controller,
            allowScrubbing: true,
            colors: VideoProgressColors(
              playedColor: Theme.of(context).colorScheme.primary,
              bufferedColor: Colors.white30,
              backgroundColor: Colors.black26,
            ),
          ),
        ),
        // Play/pause button
        GestureDetector(
          onTap: onToggle,
          child: AnimatedOpacity(
            opacity: isPlaying ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 200),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.55),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                color: Colors.white,
                size: 36,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Shown when no video URL is configured yet.
class _VideoPlaceholder extends StatelessWidget {
  const _VideoPlaceholder({required this.ipaSymbol, required this.thaiName});

  final String ipaSymbol;
  final String thaiName;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1A1A2E),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Animated mouth icon
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
            ),
            child: Icon(
              Icons.record_voice_over_rounded,
              size: 40,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            ipaSymbol,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w700,
              fontFamily: 'Kanit',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            thaiName,
            style: TextStyle(
              color: Colors.white.withOpacity(0.75),
              fontSize: 14,
              fontFamily: 'Kanit',
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              '🎬 วิดีโอกำลังเตรียม',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 13,
                fontFamily: 'Kanit',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Narration card ────────────────────────────────────────────────────────

class _NarrationCard extends StatelessWidget {
  const _NarrationCard({required this.narration});
  final String narration;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A73E8).withOpacity(0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF1A73E8).withOpacity(0.2),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.campaign_rounded,
              color: Color(0xFF1A73E8), size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              narration,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    height: 1.6,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Articulation steps ────────────────────────────────────────────────────

class _ArticulationSteps extends StatelessWidget {
  const _ArticulationSteps({required this.steps});
  final List<ArticulationStep> steps;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'วิธีออกเสียงทีละขั้นตอน',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        const SizedBox(height: 10),
        ...List.generate(
          steps.length,
          (i) => _ArticulationStepTile(step: steps[i], index: i + 1),
        ),
      ],
    );
  }
}

class _ArticulationStepTile extends StatefulWidget {
  const _ArticulationStepTile({required this.step, required this.index});
  final ArticulationStep step;
  final int index;

  @override
  State<_ArticulationStepTile> createState() => _ArticulationStepTileState();
}

class _ArticulationStepTileState extends State<_ArticulationStepTile> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final step = widget.step;
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () => setState(() => _expanded = !_expanded),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              Row(
                children: [
                  // Step number circle
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${widget.index}',
                        style: TextStyle(
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Icon(step.icon,
                      color: Theme.of(context).colorScheme.primary, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      step.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Icon(
                    _expanded
                        ? Icons.expand_less_rounded
                        : Icons.expand_more_rounded,
                    color: const Color(0xFF9AA0A6),
                  ),
                ],
              ),
              if (_expanded) ...[
                const SizedBox(height: 12),
                Text(
                  step.description,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(height: 1.6),
                ),
                if (step.tip.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFBBC04).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xFFFBBC04).withOpacity(0.4),
                      ),
                    ),
                    child: Text(
                      step.tip,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: const Color(0xFF8B6914),
                          ),
                    ),
                  ),
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// ── Common mistake card ───────────────────────────────────────────────────

class _CommonMistakeCard extends StatelessWidget {
  const _CommonMistakeCard({required this.mistake});
  final String mistake;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFEA4335).withOpacity(0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFEA4335).withOpacity(0.25),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.info_outline_rounded,
              color: Color(0xFFEA4335), size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              mistake,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.5,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Practice words ────────────────────────────────────────────────────────

class _PracticeWordsCard extends StatelessWidget {
  const _PracticeWordsCard({required this.words});
  final List<String> words;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'คำที่ควรฝึก',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: words
              .map((w) => Chip(
                    label: Text(
                      w,
                      style: const TextStyle(
                        fontFamily: 'Kanit',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    backgroundColor:
                        Theme.of(context).colorScheme.primary.withOpacity(0.08),
                    side: BorderSide(
                      color:
                          Theme.of(context).colorScheme.primary.withOpacity(0.3),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
