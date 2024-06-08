enum TTSEngine {
  hmm('hmm'),
  tacotron2Melgan('tacotron2_melgan'),
  tacotron2MbMelgan('tacotron2_mb_melgan'),
  fastspeech2Melgan('fastspeech2_melgan'),
  fastspeech2MbMelgan('fastspeech2_mb_melgan'),
  unknown('unknown');

  const TTSEngine(this.value);
  final String value;
}
