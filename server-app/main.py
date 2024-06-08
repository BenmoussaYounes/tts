from fastapi import FastAPI, File
from fastapi.responses import FileResponse

from functools import lru_cache
import uvicorn

from components.evaluation.evaluation_model import EvaluationModel
from components.evaluation.evaluation_service import save_evaluation
from components.text_to_speech.text_to_speech_model import TextToSpeechModel
from core.enums.tts_engine_enum import TTSEngine

from config import Settings
from core.tts_engines.hmm_viterbi_engine.index import HMMViterbiEngine


settings = Settings()
app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "World"}

@app.get('/tts/text_to_speech')
def text_to_speech(textToSpeech: TextToSpeechModel):
    match textToSpeech.engine:
        case TTSEngine.HMM:
            pronunciations, speech_path = HMMViterbiEngine.getTextPronunciation(textToSpeech.text)
            return  FileResponse(speech_path, media_type="audio/wav")
            
        case TTSEngine.TACOTRON2:
            return {"message": "tacotron text to speech"}
        case TTSEngine.FastSpeech2:
            return {"message": "fast speech text to speech"}
        case _:
            return {"message": "text to speech"}

@app.post('/tts/evaluate')
async def evaluate_text_to_speech(evaluation: EvaluationModel):
    result = await save_evaluation(evaluation)
    return result

uvicorn.run(app, host='0.0.0.0', port=settings.port)