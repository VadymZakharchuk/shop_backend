import mongoose from "mongoose"
import { GridFSBucket } from 'mongodb';

export let gfs: GridFSBucket | null = null;
export async function connectMongoDB() {
  const url = process.env.MONGODB_URL || "mongodb://localhost:27017/shop"

  try {
    await mongoose.connect(url)
    console.log(`Database connected: ${url}`)
  } catch (err) {
    if (err instanceof Error) {
      console.error(err.message)
    } else {
      console.error('Unknown error', err)
    }
    process.exit(1);
  }
  const conn = mongoose.connection

  conn.once('open', () => {
    console.log('MongoDB connection open');
    gfs = new mongoose.mongo.GridFSBucket(conn.db!, {
      bucketName: 'uploads'
    });
  })

  conn.on('connected', () => console.log(`Database connected: ${url}`))
  conn.on('open', () => console.log('open'))
  conn.on('disconnected', () => console.log('disconnected'))
  conn.on('reconnected', () => console.log('reconnected'))
  conn.on('disconnecting', () => console.log('disconnecting'))
  conn.on('close', () => console.log('close'))
  conn.on("error", (err) => { console.error(`connection error: ${err}`) })
  return;
}