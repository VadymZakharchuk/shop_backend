import { prisma } from "@/server";
import { Colors, Prisma } from "@prisma/client";
import { logger } from "@/utils/log";

export class ColorsService {
  getColors(): Promise<Colors[]> {
    try {
      return prisma.colors.findMany()
    }
    catch (e) {
      logger.error(e);
      throw new Error('getColors service error');
    }
  }
  getColorOne(id: string): Promise<Colors> {
    try {
      return prisma.colors.findUnique({
        where: {
          id: +id
        }
      }) as Promise<Colors>;
    }
    catch (e) {
      logger.error(e);
      throw new Error('getColors service error');
    }
  }
  createColor(color: Colors): Promise<Colors> {
    try {
      return prisma.colors.create({ data: color });
    }
    catch (e) {
      logger.error(e);
      throw new Error('createColor service error');
    }
  }

  updateColor(id: number, color: Colors): Promise<Colors> {
    try {
      return prisma.colors.update({ where: { id }, data: color });
    }
    catch (e) {
      logger.error(e);
      throw new Error('updateColor service error');
    }
  }

  deleteColor(id: number): Promise<Colors> {
    try {
      return prisma.colors.delete({ where: { id } });
    }
    catch (e) {
      logger.error(e);
      throw new Error('deleteColor service error');
    }
  }
}