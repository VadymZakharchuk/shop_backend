import { prisma } from "@/server";
import { Products, Prisma, Colors} from "@prisma/client";
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
  getProductOne(idNo: string): Promise<Products[]> {
    try {
      return prisma.products.findMany({
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
  createProduct(product: Products): Promise<Products> {
    try {
      let productData: Prisma.ProductsCreateInput = {
        ...product,
      };
      return prisma.products.create({ data: productData });
    }
    catch (e) {
      logger.error(e);
      throw new Error('createProduct service error');
    }
  }

  updateProduct(id: number, product: Products): Promise<Products> {
    try {
      // @ts-ignore
      return prisma.products.update({ where: { id }, data: product });
    }
    catch (e) {
      logger.error(e);
      throw new Error('updateProduct service error');
    }
  }

  deleteProduct(id: number): Promise<Products> {
    try {
      return prisma.products.delete({ where: { id } });
    }
    catch (e) {
      logger.error(e);
      throw new Error('deleteProduct service error');
    }
  }
}