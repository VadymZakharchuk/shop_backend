import mongoose from 'mongoose';
import { IFile } from "@/mongoose/modelsTypes";

const fileSchema = new mongoose.Schema({
  filename: { type: String, required: true },
  filepath: { type: String, required: true },
  userId : mongoose.Types.ObjectId,
  uploadDate: { type: Date, default: Date.now }
})

const File = mongoose.model<IFile>('File', fileSchema);
export default File