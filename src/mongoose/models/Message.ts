import mongoose from 'mongoose'
import { Schema, Document } from 'mongoose';
import { IMessage } from '../modelsTypes';
interface IMessageDocument extends IMessage, Document {}

const messageSchema = new mongoose.Schema<IMessageDocument>(
  {
    room: { type: String, required: true },
    message: { type: String, required: true },
    files: [String],
    authorId: { type: Schema.Types.ObjectId, ref: 'Customer', required: true },
  },
  {
    timestamps: {
      createdAt: 'createdAt', updatedAt: 'updatedAt'
    }
  }
)
const Message = mongoose.model<IMessageDocument>('Message', messageSchema)

export default Message