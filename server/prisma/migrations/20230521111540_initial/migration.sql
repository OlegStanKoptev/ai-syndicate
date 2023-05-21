-- CreateEnum
CREATE TYPE "UserRole" AS ENUM ('user', 'expert', 'admin', 'developer');

-- CreateEnum
CREATE TYPE "StartupStatus" AS ENUM ('verification', 'verification_failed', 'verification_succeded', 'financing', 'financing_failed', 'financing_succeded', 'developerApplication', 'developerVoting');

-- CreateEnum
CREATE TYPE "ApplicationNewDeveloperStatus" AS ENUM ('new', 'approved', 'declined');

-- CreateEnum
CREATE TYPE "ApplicationDeveloperStatus" AS ENUM ('new');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "role" "UserRole" NOT NULL,
    "balance" INTEGER,
    "createdById" TEXT,
    "email" TEXT NOT NULL,
    "passwordHash" TEXT NOT NULL,
    "fullName" TEXT,
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
    "targetFinancing" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "logoFile" TEXT,
    "specificationFile" TEXT NOT NULL,
    "businessPlanFile" TEXT,
    "presentationFile" TEXT,
    "financingDeadline" TIMESTAMP(3),
    "developerApplicationDeadline" TIMESTAMP(3),
    "developerVotingDeadline" TIMESTAMP(3),

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

-- CreateTable
CREATE TABLE "Investment" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "amount" INTEGER NOT NULL,
    "investorId" TEXT NOT NULL,
    "startupId" TEXT NOT NULL,

    CONSTRAINT "Investment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ApplicationNewDeveloper" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "status" "ApplicationNewDeveloperStatus" NOT NULL,
    "declineReason" TEXT,
    "email" TEXT NOT NULL,
    "passwordHash" TEXT NOT NULL,
    "avatarImageFile" TEXT,
    "orgName" TEXT NOT NULL,
    "shortOrgName" TEXT NOT NULL,
    "inn" TEXT NOT NULL,
    "ogrn" TEXT NOT NULL,
    "kpp" TEXT NOT NULL,
    "legalAddress" TEXT NOT NULL,
    "actualAddress" TEXT NOT NULL,
    "website" TEXT NOT NULL,
    "phone" TEXT,

    CONSTRAINT "ApplicationNewDeveloper_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ApplicationDeveloper" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "startupId" TEXT NOT NULL,
    "developerId" TEXT NOT NULL,
    "status" "ApplicationDeveloperStatus" NOT NULL,
    "message" TEXT NOT NULL,

    CONSTRAINT "ApplicationDeveloper_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "VoteNewStartup_startupId_expertId_key" ON "VoteNewStartup"("startupId", "expertId");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Startup" ADD CONSTRAINT "Startup_startuperId_fkey" FOREIGN KEY ("startuperId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VoteNewStartup" ADD CONSTRAINT "VoteNewStartup_startupId_fkey" FOREIGN KEY ("startupId") REFERENCES "Startup"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VoteNewStartup" ADD CONSTRAINT "VoteNewStartup_expertId_fkey" FOREIGN KEY ("expertId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Investment" ADD CONSTRAINT "Investment_investorId_fkey" FOREIGN KEY ("investorId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Investment" ADD CONSTRAINT "Investment_startupId_fkey" FOREIGN KEY ("startupId") REFERENCES "Startup"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ApplicationDeveloper" ADD CONSTRAINT "ApplicationDeveloper_startupId_fkey" FOREIGN KEY ("startupId") REFERENCES "Startup"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ApplicationDeveloper" ADD CONSTRAINT "ApplicationDeveloper_developerId_fkey" FOREIGN KEY ("developerId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
