import express, { NextFunction, Request, Response } from 'express';
import dotenv from "dotenv";
import { PrismaClient } from "@prisma/client";
import { logger } from "@/utils/log";
import helmet from "helmet";
import cors from "cors";
import compression from "compression";
import { authRouter } from "@/auth/auth.controller";
import { colorsRouter } from "./colors/colors.controller";
import { usersRouter } from "@/users/users.controller";
import { productsRouter } from "@/products/products.controller";
import * as process from "node:process";

dotenv.config();

const app = express();
export const prisma = new PrismaClient()
const PORT = process.env.PORT || 3000;

async function main() {
  app.use(express.json());
  app.use(helmet({
    xPoweredBy: false,
  }));
  app.use(cors())
  app.use(compression());

  app.use('/api/auth', authRouter)
  app.use('/api/colors', colorsRouter)
  app.use('/api/users', usersRouter)
  app.use('/api/products', productsRouter)

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
.then(async() => await prisma.$connect())
.catch(async error => {
  logger.error(error)
  await prisma.$disconnect()
  process.exit(1)
});