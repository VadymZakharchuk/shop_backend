import { prisma } from "@/server";
import { Products, Prisma } from "@prisma/client";
import { logger } from "@/utils/log";

export class ProductsService {
  getProducts(): Promise<Products[]> {
    try {
      return prisma.products.findMany({
        include: {
          Colors: true
        }
      })
    }
    catch (e) {
      logger.error(e);
      throw new Error('getProducts service error');
    }
  }
  getProductOne(idNo: string): Promise<Products | null> {
    try {
      return prisma.products.findUnique({
        where: {
          id: +idNo,
        },
        include: {
          Colors: true
        }
      })
    }
    catch (e) {
      logger.error(e);
      throw new Error('getProductOne service error');
    }
  }
  //Type null is not assignable to type JsonNull | InputJsonValue
  createProduct(product: Products): Promise<Products> {
    try {
      const preparedProduct: Products & { options: any} = product
      if (product.options === null || product.options === undefined) { preparedProduct.options = '{}'}
      return prisma.products.create({ data: preparedProduct });
    }
    catch (e) {
      logger.error(e);
      throw new Error('createProduct service error');
    }
  }

  updateProduct(id: string, product: Products & { options: any}): Promise<Products> {
    try {
      return prisma.products.update({ where: { id: +id }, data: product });
    }
    catch (e) {
      logger.error(e);
      throw new Error('updateProduct service error');
    }
  }

  deleteProduct(id: string): Promise<Products> {
    try {
      return prisma.products.delete({ where: { id: +id } });
    }
    catch (e) {
      logger.error(e);
      throw new Error('deleteProduct service error');
    }
  }
}