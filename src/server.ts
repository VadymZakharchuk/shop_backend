import express, { NextFunction, Request, Response } from 'express'
import dotenv from "dotenv"
import { createServer } from "http"
import { PrismaClient } from "@prisma/client"
import { MongoClient } from 'mongodb'
import { Server } from "socket.io"
import { logger } from "@/utils/log"
import { GridFsStorage } from "multer-gridfs-storage"
import Grid from "gridfs-stream"
import methodOverride from "method-override"
import helmet from "helmet"
import cors from "cors"
import compression from "compression"
import * as process from "node:process"
import { apiRouter } from "@/router"
import { socketController } from "@/socket-io/socket.controller"
import { connectMongoDB } from "@/mongoose/config"

dotenv.config();

const app = express();
const server = createServer(app);
export const io = new Server(server, {
  cors: {
    origin: '*'
  }
})
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

  app.use(methodOverride('_method'));
  app.set('view engine', 'ejs');

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

  await connectMongoDB()

  server.listen(PORT, () => {
    logger.info(`Server is running on port ${PORT}`);
  })
}

main()
.then(async() => {
  await prisma.$connect()
  // await runMongo()
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
    console.log("Successfully connected to MongoDB!");
  } catch (error) {
    logger.error(error)
    await mongo.close()
    process.exit(1)
  }
}