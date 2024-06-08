from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    db_url: str
    port : int = 8000
    app_name: str = "Fast Service API"

    model_config = SettingsConfigDict(env_file=".env")


