-- CreateEnum
CREATE TYPE "engine" AS ENUM ('hmm', 'tacotron2_melgan', 'tacotron2_mb_melgan', 'fastspeech2_melgan', 'fastspeech2_mb_melgan');

-- CreateEnum
CREATE TYPE "MOS" AS ENUM ('bad', 'poor', 'fair', 'good', 'excellent');

-- CreateTable
CREATE TABLE "Evaluation" (
    "id" SERIAL NOT NULL,
    "engine" "engine" NOT NULL,
    "text" TEXT NOT NULL,
    "comprehensibility" "MOS" NOT NULL,
    "naturalness" "MOS" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Evaluation_pkey" PRIMARY KEY ("id")
);
