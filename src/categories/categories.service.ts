import { prisma } from "@/server";
import { Categories,  } from "@prisma/client";
import { logger } from "@/utils/log";

const rawSQL = 'SELECT * FROM `node-shop`.`Categories` WHERE LENGTH(level) <'
export class CategoriesService {
  getCategories(): Promise<Categories[]> {
    try {
      return prisma.categories.findMany()
    }
    catch (e) {
      logger.error(e);
      throw new Error('getCategories service error');
    }
  }

  getCategoryTree(level: string): Promise<Categories[]> {
    try {
      if (level === 'root') {
        return prisma.categories.findMany({
          where: {
            level_len: {
              lt: 2
            }
          }
        });
      }
      return prisma.categories.findMany({
        where: {
          level: {
            startsWith: level.toUpperCase()
          }
        }
      });
    }
    catch (e) {
      logger.error(e);
      throw new Error('getCategories service error');
    }
  }

  createCategory(user: Categories): Promise<Categories> {
    try {
      return prisma.categories.create({ data: user });
    }
    catch (e) {
      logger.error(e);
      throw new Error('createCategory service error');
    }
  }

  updateCategory(id: number, user: Categories): Promise<Categories> {
    try {
      return prisma.categories.update({ where: { id }, data: user });
    }
    catch (e) {
      logger.error(e);
      throw new Error('updateCategory service error');
    }
  }

  deleteCategory(id: number): Promise<Categories> {
    try {
      return prisma.categories.delete({ where: { id } });
    }
    catch (e) {
      logger.error(e);
      throw new Error('deleteCategory service error');
    }
  }
}