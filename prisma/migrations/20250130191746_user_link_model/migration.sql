/*
  Warnings:

  - The primary key for the `User` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `createdAt` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `User` table. All the data in the column will be lost.
  - Added the required column `password` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `User` DROP PRIMARY KEY,
    DROP COLUMN `createdAt`,
    DROP COLUMN `name`,
    DROP COLUMN `updatedAt`,
    ADD COLUMN `password` VARCHAR(191) NOT NULL,
    MODIFY `id` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- CreateTable
CREATE TABLE `Link` (
    `id` VARCHAR(191) NOT NULL,
    `shortUrl` VARCHAR(191) NOT NULL,
    `originalUrl` VARCHAR(191) NOT NULL,
    `userId` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Link_shortUrl_key`(`shortUrl`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Link` ADD CONSTRAINT `Link_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
