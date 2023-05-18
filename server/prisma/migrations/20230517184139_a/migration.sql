-- CreateEnum
CREATE TYPE "UserRole" AS ENUM ('user', 'expert', 'admin', 'developer');

-- CreateEnum
CREATE TYPE "StartupStatus" AS ENUM ('verification', 'verification_failed', 'verification_succeded', 'financing');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "role" "UserRole" NOT NULL,
    "balance" INTEGER,
    "email" TEXT NOT NULL,
    "passwordHash" TEXT NOT NULL,
    "fullName" TEXT NOT NULL,
    "avatarImageFile" TEXT,
    "orgName" TEXT,
    "shortOrgName" TEXT,
    "inn" TEXT,
    "ogrn" TEXT,
    "kpp" TEXT,
    "legalAddress" TEXT,
    "actualAddress" TEXT,
    "website" TEXT,
    "phone" TEXT,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Startup" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "status" "StartupStatus" NOT NULL,
    "startuperId" TEXT NOT NULL,
    "targetFinancing" INTEGER,
    "financingDeadline" TIMESTAMP(3),
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "logoFile" TEXT,
    "specificationFile" TEXT NOT NULL,
    "businessPlanFile" TEXT,
    "presentationFile" TEXT,

    CONSTRAINT "Startup_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "VoteNewStartup" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "startupId" TEXT NOT NULL,
    "expertId" TEXT NOT NULL,
    "yea" BOOLEAN NOT NULL,
    "nayReason" TEXT,

    CONSTRAINT "VoteNewStartup_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "VoteNewStartup_startupId_expertId_key" ON "VoteNewStartup"("startupId", "expertId");

-- AddForeignKey
ALTER TABLE "Startup" ADD CONSTRAINT "Startup_startuperId_fkey" FOREIGN KEY ("startuperId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VoteNewStartup" ADD CONSTRAINT "VoteNewStartup_expertId_fkey" FOREIGN KEY ("expertId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
