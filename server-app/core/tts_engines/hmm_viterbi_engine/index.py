from core.tts_engines.hmm_viterbi_engine.hmm_viterbi_algorithm import getObj, createObj

class HMMViterbiEngine:
    @staticmethod
    def getTextPronunciation(sentence:str):
     hmm = getObj()
     pronunciations, speech_path = hmm.pronounce(sentence)
     return pronunciations, speech_path # print(f"Pronunciations of {sentence}: {pronunciations}")