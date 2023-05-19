import { PrismaClient } from "@prisma/client";
import bcrypt from "bcryptjs";
const db = new PrismaClient();

async function seed() {
  await db.user.create({
    data: {
      role: "admin",
      email: "admin@admin.com",
      passwordHash: await bcrypt.hash("admin", 10),
      fullName: "Admin Adminov",
    },
  });
  await db.user.create({
    data: {
      role: "user",
      email: "startuper@startuper.com",
      passwordHash: await bcrypt.hash("startuper", 10),
      fullName: "Startuper Startuperov",
      balance: 0,
    },
  });
  await db.user.create({
    data: {
      role: "user",
      email: "investor@investor.com",
      passwordHash: await bcrypt.hash("investor", 10),
      fullName: "Investor Investorov",
      balance: 1000,
    },
  });
  await db.user.create({
    data: {
      role: "expert",
      email: "expert@expert.com",
      passwordHash: await bcrypt.hash("expert", 10),
      fullName: "Expert Expertov",
    },
  });
  await db.user.create({
    data: {
      role: "developer",
      email: "developer@developer.com",
      passwordHash: await bcrypt.hash("developer", 10),
      phone: "+76666666666",
      avatarImageFile: "avatar1.jpg",
      orgName: "АО Разработчики программ ИИ",
      shortOrgName: "Разработчики ИИ",
      inn: "7734247100",
      ogrn: "1027739098166",
      kpp: "771401001",
      legalAddress:
        "115553, Московская обл., г. Москва, ул. 1-ый Нагатинский проезд, д. 11, корпус 1",
      actualAddress:
        "115553, Московская обл., г. Москва, ул. 1-ый Нагатинский проезд, д. 11, корпус 1",
      website: "ii-developers.com",
    },
  });
}

seed();
