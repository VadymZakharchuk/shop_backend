import express, { NextFunction, Request, Response } from 'express'
import dotenv from "dotenv"
import { createServer } from "http"
import { PrismaClient } from "@prisma/client"
import { MongoClient } from 'mongodb'
import { Server } from "socket.io"
import { logger } from "@/utils/log"
import methodOverride from "method-override"
import helmet from "helmet"
import cors from "cors"
import compression from "compression"
import * as process from "node:process"
import { apiRouter } from "@/router"
import { socketController } from "@/socket-io/socket.controller"
import { connectMongoDB } from "@/mongoose/config"

dotenv.config();

export const app = express();
const server = createServer(app);
export const io = new Server(server, {
  cors: {
    origin: '*'
  }
})

export const prisma = new PrismaClient()
const PORT = process.env.PORT || 3000;

async function main() {
  try {
    await connectMongoDB()
    app.use(express.json());
    app.use(helmet({
      xPoweredBy: false,
    }));
    app.use(cors())
    app.use(compression());

    app.use(methodOverride('_method'));
    app.set('view engine', 'ejs');
    app.use(express.urlencoded({extended: true}))

    app.use("/api", apiRouter)
    app.all('*', (req, res) => {
      res.status(404).send('Route not Found');
    })

    app.use((err: Error, req: Request, res: Response, next: NextFunction) => {
      logger.error(err.stack);
      res.status(500).send('Something went wrong');
    })

    io.on('connection', (socket) => {
      socketController(socket)
    })

    server.listen(PORT, () => {
      logger.info(`Server is running on port ${PORT}`);
    })
  } catch (error) {
    console.error("❌ Error during initial setup:", error);
    // Обробка помилки верхнього рівня
  }
}

main()
.then(async() => {
  // await prisma.$connect()
})
.catch(async error => {
  console.error(error)
  await prisma.$disconnect()
  process.exit(1)
});
