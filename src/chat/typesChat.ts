import { ObjectId } from 'mongodb'

export interface Chat {
  _id: ObjectId;
  room: string;
  message: string;
  files?: string;
  createdAt: Date;
  updatedAt: Date;
}