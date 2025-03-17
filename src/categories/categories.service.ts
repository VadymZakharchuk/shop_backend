import { prisma } from "@/server";
import { Categories, Prisma } from "@prisma/client";
import { logger } from "@/utils/log";

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

  createCategory(category: Categories): Promise<Categories> {
    try {
      return prisma.categories.create({ data: category });
    }
    catch (e) {
      logger.error(e);
      throw new Error('createCategory service error');
    }
  }

  updateCategory(id: string, category: Categories): Promise<Categories> {
    try {
      return prisma.categories.update({ where: { id: +id }, data: category });
    }
    catch (e) {
      logger.error(e);
      throw new Error('updateCategory service error');
    }
  }

  deleteCategory(id: string): Promise<Categories> {
    try {
      return prisma.categories.delete({ where: { id: +id } });
    }
    catch (e) {
      logger.error(e);
      throw new Error('deleteCategory service error');
    }
  }
}