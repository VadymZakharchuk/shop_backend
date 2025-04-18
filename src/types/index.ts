import { ObjectId } from "mongodb";

export interface IFile {
  _id: ObjectId;
  filename: string;
  contentType: string;
  length: number;
  uploadDate: Date;
  metadata?: any;
}