from prisma import Prisma
from components.evaluation.evaluation_model import EvaluationModel


async def save_evaluation(evaluation: EvaluationModel) -> EvaluationModel:
    try:
        db = Prisma()
        await db.connect()    
        data = {
            "text": evaluation.text,
            "engine": evaluation.engine.value,
            "naturalness": evaluation.naturalness.value,
            "comprehensibility": evaluation.comprehensibility.value,
        }
        await db.evaluation.create(data=data)
        return evaluation
    except Exception as e:
        print(e)
        return None
    