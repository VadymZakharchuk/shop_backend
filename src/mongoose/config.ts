import mongoose, { Connection} from "mongoose"
import Grid from "gridfs-stream"
import { FilesService } from "@/files/files.service";
import { filesRouter } from "@/files/files.controller";
import { app } from "@/server";

let gfs: Grid.Grid | null = null
let conn: Connection
export const connectMongoDB = async () => {
  const url = process.env.MONGODB_URL || "mongodb://localhost:27017/chat"

  try {
    await mongoose.connect(url)
    const db = mongoose.connection
    gfs = Grid(db, mongoose.mongo)
    gfs.collection("uploads")

    console.log("✅ Multer GridFS initialized")

    const filesService = new FilesService();
    const filesRoutes = filesRouter(filesService);
    app.use("/api/files", filesRoutes);
    console.log("✅ fileRouter connected")

  } catch (err) {
    console.error("❌ DB connection or storage init error", err)
    process.exit(1)
  }
}

export const getGfs = (): Grid.Grid => {
  if (!gfs) {
    throw new Error("❌ GridFS not initialized")
  }
  return gfs
}
