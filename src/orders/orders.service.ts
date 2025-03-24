import { prisma } from "@/server";
import { logger } from "@/utils/log";
import { Orders } from "@prisma/client";

type nextOrderNo = {
  f0: string
}
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

  async orderOne(id: string) {
    try {
      return await prisma.orders.findMany({
        where: {
          orderNo: id
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

  async createOrder(orderItems: Orders[]) {
    try {
      // get next order number
      const { _max } = await prisma.orders.aggregate({ _max: { orderNo: true } })
      const orderNo:  string | null = _max.orderNo ? (+_max.orderNo + 1).toString() : null;
      console.log(orderNo);

      // check if transaction available
      let isTransactionAvailable =  true
      const result = []
      for (const item of orderItems) {
        const stock = await prisma.stock.findUnique({ where: { id: item.stockRef } })
        if (!stock || !item.quantity || stock.countStock < item.quantity) {
          isTransactionAvailable = false
          result.push(`not enough stock for stock ID :: ${item.stockRef}`)
        }
        item.orderNo = orderNo
        item.operDate = new Date();
      }

      if (!isTransactionAvailable) { return result }

      for (const item of orderItems) {
        await prisma.stock.update({
          where: { id: item.stockRef },
          data: {
            countStock: {
              decrement: item.quantity!
            },
            countOrdered: {
              increment: item.quantity!
            }
          }
        })
      }
      return await prisma.orders.createMany({ data: [...orderItems] })
    }
    catch (e) {
      logger.error(e);
      throw new Error(`insertInto service error ${e}`);
    }
  }

  async updateOne(id: string, orderItem: Orders) {
    try {
      return await prisma.orders.update({ where: { id: +id }, data: orderItem });
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

  async updateOrderStatus(orderId: string, orderStatus: string, direction = true) {
    try {
      return await prisma.$executeRaw`call updateOrderStockStatus(${orderId}, ${orderStatus}, ${direction})`;
    }
    catch (e) {
      logger.error(e);
      throw new Error('deleteOne service error');
    }
  }
}
