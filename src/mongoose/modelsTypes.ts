import {type Document, Types} from "mongoose";

export interface ICustomer {
  name: string;
  email:  string;
  password:  string;
  phone?:  string;
  role?: string;
  address?:  string;
  createdAt?: Date;
}

export interface IMessage {
  room: string;
  message: string;
  files?: string[];
  authorId: Types.ObjectId;
}

export type IMessagePopulated = Omit<IMessage, 'authorId'> & {
  authorId: ICustomer;
}

export interface IFile extends Document {
  filename: string;
  filepath: string;
  userId: string;
  uploadDate: Date;
}
