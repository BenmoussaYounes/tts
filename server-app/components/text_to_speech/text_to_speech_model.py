from core.enums.tts_engine_enum import TTSEngine
from pydantic import BaseModel


class TextToSpeechModel(BaseModel):
    text : str
    engine : TTSEngine