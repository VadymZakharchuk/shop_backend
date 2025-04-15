import { ObjectId } from 'mongodb'

export interface Chat {
  _id: ObjectId;
  room: string;
  message: string;
  files?: string;
  authorId: ObjectId;
  createdAt: Date;
  updatedAt: Date;
}