-- CreateTable
CREATE TABLE `Colors` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name_uk` VARCHAR(191) NOT NULL,
    `name_en` VARCHAR(191) NOT NULL,
    `image` VARCHAR(191) NOT NULL DEFAULT 'white',

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Products` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name_uk` VARCHAR(191) NOT NULL DEFAULT 'none',
    `name_en` VARCHAR(191) NOT NULL DEFAULT 'none',
    `description_uk` TEXT NOT NULL,
    `description_en` TEXT NOT NULL,
    `price` DOUBLE NOT NULL DEFAULT 0,
    `discount` DOUBLE NOT NULL DEFAULT 0,
    `isNew` BOOLEAN NOT NULL DEFAULT false,
    `isArchived` BOOLEAN NOT NULL DEFAULT false,
    `colorRef` INTEGER NOT NULL,
    `size` ENUM('XS', 'S', 'M', 'L', 'XL', 'XXL', 'XXXL') NOT NULL DEFAULT 'L',
    `sex` ENUM('MAN', 'WOMAN', 'UNISEX') NOT NULL DEFAULT 'UNISEX',
    `options` JSON NULL,
    `imageUrl` JSON NULL,

    INDEX `colorFK_idx`(`colorRef`),
    INDEX `indexNameUk`(`name_uk`, `name_en`),
    INDEX `nameUk_idx`(`name_uk`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Users` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NULL,
    `email` VARCHAR(191) NOT NULL,
    `phone` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `countOrders` INTEGER NOT NULL DEFAULT 0,
    `countVisits` INTEGER NOT NULL DEFAULT 0,
    `role` ENUM('ADMIN', 'CLIENT', 'GUEST', 'SELLER') NOT NULL DEFAULT 'GUEST',
    `address` JSON NOT NULL,

    UNIQUE INDEX `Users_email_key`(`email`),
    UNIQUE INDEX `Users_phone_key`(`phone`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Products` ADD CONSTRAINT `colorFK` FOREIGN KEY (`colorRef`) REFERENCES `Colors`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

