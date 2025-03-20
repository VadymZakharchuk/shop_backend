import { prisma } from "@/server";
import { logger } from "@/utils/log";
import { Orders } from "@prisma/client";

export class OrdersService {
  async ordersList(query: any): Promise<Orders[]> {
    try {
      return await prisma.orders.findMany({
        where: {
          ...query
        },
        include: {
          Users: true,
          Stock: true
        }
      })
    }
    catch (e) {
      logger.error(e);
      throw new Error('ordersList service error');
    }
  }

  async ordersOne(id: string) {
    try {
      return await prisma.orders.findMany({
        where: {
          id: +id
        },
        include: {
          Users: true,
          Stock: true
        }
      })
    }
    catch (e) {
      logger.error(e);
      throw new Error('ordersOne service error');
    }
  }

  async createOne(ordersItem: Orders) {
    try {
      return await prisma.orders.create({ data: ordersItem });
    }
    catch (e) {
      logger.error(e);
      throw new Error('createOne service error');
    }
  }

  async updateOne(id: string, ordersItem: Orders) {
    try {
      return await prisma.orders.update({ where: { id: +id }, data: ordersItem });
    }
    catch (e) {
      logger.error(e);
      throw new Error('updateOne service error');
    }
  }

  async deleteOne(id: string) {
    try {
      return await prisma.orders.delete({ where: { id: +id } });
    }
    catch (e) {
      logger.error(e);
      throw new Error('deleteOne service error');
    }
  }
}
