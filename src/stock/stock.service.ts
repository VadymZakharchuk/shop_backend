import { prisma } from "@/server";
import { logger } from "@/utils/log";
import { Stock } from "@prisma/client";

export class StockService {
  async stockList(query: any): Promise<Stock[]> {
    try {
      return await prisma.stock.findMany({
        where: {
          ...query
        },
        include: {
          Products: true,
          Suppliers: true
        }
      })
    }
    catch (e) {
      logger.error(e);
      throw new Error('stockList service error');
    }
  }

  async stockOne(id: string) {
    try {
      return await prisma.stock.findMany({
        where: {
          id: +id
        },
        include: {
          Products: true,
          Suppliers: true
        }
      })
    }
    catch (e) {
      logger.error(e);
      throw new Error('stockOne service error');
    }
  }

  async createOne(stockItem: Stock) {
    try {
      return await prisma.stock.create({ data: stockItem });
    }
    catch (e) {
      logger.error(e);
      throw new Error('createOne service error');
    }
  }

  async updateOne(id: string, stockItem: Stock) {
    try {
      return await prisma.stock.update({ where: { id: +id }, data: stockItem });
    }
    catch (e) {
      logger.error(e);
      throw new Error('updateOne service error');
    }
  }

  async deleteOne(id: string) {
    try {
      return await prisma.stock.delete({ where: { id: +id } });
    }
    catch (e) {
      logger.error(e);
      throw new Error('deleteOne service error');
    }
  }
}
