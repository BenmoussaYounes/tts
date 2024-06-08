from core.enums.mos_enum import MOS
from core.enums.tts_engine_enum import TTSEngine
from pydantic import BaseModel


class EvaluationModel(BaseModel):
    engine: TTSEngine
    text: str
    comprehensibility: MOS
    naturalness: MOS


