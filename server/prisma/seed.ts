import { PrismaClient } from "@prisma/client";
const db = new PrismaClient();

async function seed() {
  await db.user.create({
    data: {
      role: "admin",
      email: "admin@admin.com",
      passwordHash:
        "$2a$10$p1OL5FBppbCq1yUTHN5PeeGzMIGOK6O/oEtClgCFYsgcK9L2DzKJ2",
      fullName: "Admin Adminov",
    },
  });
}

seed();
