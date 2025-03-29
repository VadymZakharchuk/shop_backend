import { prisma } from "@/server";
import { logger } from "@/utils/log";
import {Orders, Orders_operStatus} from "@prisma/client";

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
      // change stock status
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
      // insert into orders
      return await prisma.orders.createMany({ data: [...orderItems] })
    }
    catch (e) {
      logger.error(e);
      throw new Error(`createOrder service error ${e}`);
    }
  }
  async verifyStockUpdates(orderItems: Orders[]) {
    const newStatus: Orders_operStatus = orderItems[0].operStatus || 'STOCK'
    const enumArr = Array.from(Object.values(Orders_operStatus));
    const indexNew = enumArr.indexOf(newStatus)
    try {
      const orders = await prisma.orders.findMany({
        where: { orderNo: orderItems[0].orderNo }
      })
      const oldStatus = orders[0].operStatus || 'STOCK'
      const indexOld = enumArr.indexOf(oldStatus)
      const isForward = indexNew > indexOld ? 1 : 0
      const itemsJson = JSON.stringify(orderItems)
      const resValidation = await prisma.$queryRaw`call verifyStockUpdates(${itemsJson}, ${isForward})`
      const res: object & { f0: string } = Array.from(Object.values(resValidation as object))[0]
      return !res.f0.includes('0')
    }
    catch (e) {
      logger.error(e);
      throw new Error(`verifyStockUpdates service error ${e}`);
    }
  }
  async updateOrder(orderId: string, orderItems: Orders[]) {
    const itemsJson = JSON.stringify(orderItems)
    try {
      const result = await prisma.$queryRaw`call stockManager(${orderId}, ${itemsJson})`
      return Array.from(Object.values(result as object))
    }
    catch (e) {
      logger.error(e);
      throw new Error(`updateOrder service error ${e}`);
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
