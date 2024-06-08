from enum import Enum

class TTSEngine(Enum):
    HMM = 'hmm'
    TACOTRON2MELGAN = 'tacotron2_melgan'
    TACOTRON2MBMELGAN = 'tacotron2_mb_melgan'
    FASTSPEECH2MELGAN = 'fastspeech2_melgan'
    FASTSPEECH2MBMELGAN = 'fastspeech2_mb_melgan'
    


