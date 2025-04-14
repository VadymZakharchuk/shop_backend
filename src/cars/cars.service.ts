import { logger } from "@/utils/log";
import { mongo } from "@/server";
import type { Cars } from "@/cars/Cars";

export class CarsService {
  async getCars(query: object) {
    const db = mongo.db('cars')
    const colCars = db.collection<Cars[]>('wanted')
    try {
      const cursor = colCars.find({...query});
      return await cursor.toArray();
    }
    catch (e) {
      logger.error(e);
      throw new Error('mongo cars->wanted->getCars service error');
    }
  }
}