import express, { NextFunction, Request, Response } from 'express';
import dotenv from "dotenv";
import { PrismaClient } from "@prisma/client";
import { MongoClient } from 'mongodb'
import { logger } from "@/utils/log";
import helmet from "helmet";
import cors from "cors";
import compression from "compression";
import * as process from "node:process";
import { authRouter } from "@/auth/auth.controller";
import { colorsRouter } from "./colors/colors.controller";
import { usersRouter } from "@/users/users.controller";
import { productsRouter } from "@/products/products.controller";
import { categoriesRouter } from "@/categories/categories.controller";
import { stockRouter } from "@/stock/stock.controller";
import { ordersRouter } from "@/orders/orders.controller";
import { chatRouter } from "@/chat/chat.controller";

dotenv.config();

const app = express();
export const prisma = new PrismaClient()
const PORT = process.env.PORT || 3000;

const mongoUrl = process.env.MONGODB_URL || "mongodb://localhost:27017/shop";
export const mongo = new MongoClient(mongoUrl)
async function main() {
  app.use(express.json());
  app.use(helmet({
    xPoweredBy: false,
  }));
  app.use(cors())
  app.use(compression());

  app.use('/api/auth', authRouter)
  app.use('/api/chat', chatRouter)
  app.use('/api/colors', colorsRouter)
  app.use('/api/users', usersRouter)
  app.use('/api/products', productsRouter)
  app.use('/api/categories', categoriesRouter)
  app.use('/api/stock', stockRouter)
  app.use('/api/orders', ordersRouter)

  app.all('*', (req, res) => {
    res.status(404).send('Route not Found');
  })

  app.use((err: Error, req: Request, res: Response, next: NextFunction) => {
    logger.error(err.stack);
    res.status(500).send('Something went wrong');
  })

  app.listen(PORT, () => {
    logger.info(`Server is running on port ${PORT}`);
  })
}

main()
.then(async() => {
  await prisma.$connect()
  await runMongo()
})
.catch(async error => {
  logger.error(error)
  await prisma.$disconnect()
  process.exit(1)
});

async function runMongo() {
  try {
    // Connect the client to the server
    await mongo.connect();
    // Send a ping to confirm a successful connection
    // await mongo.db("admin").command({ ping: 1 });
    console.log("Successfully connected to MongoDB!");
  } catch (error) {
    logger.error(error)
    await mongo.close()
    process.exit(1)
  }
}