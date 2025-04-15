import { logger } from "@/utils/log";
import {IMessage, IMessagePopulated} from "@/mongoose/modelsTypes";
import Message from "@/mongoose/models/Message";

export class ChatService {
  async getAll(query: object): Promise<IMessagePopulated[]> {
    try {
      return await Message.find({...query}).populate('authorId') as unknown as IMessagePopulated[]
    }
    catch (e) {
      logger.error(e);
      throw new Error('mongo chat->messages->getAll service error');
    }
  }

  async updateMessage(id: string, data: Promise<IMessage>) {
    try {
      return await Message.findOneAndUpdate({ _id: id }, data, { new: true });
    }
    catch (e) {
      logger.error(e);
      throw new Error('mongo chat->messages->getAll service error');
    }
  }
  async createMessage(data:Promise<IMessage[]>): Promise<IMessage> {
    try {
      const message = new Message(data)
      await message.save()
      return message
    } catch (error) {
      logger.error(error);
      throw new Error('mongo chat->messages->createMessage service error');
    }
  }
  async deleteMessage(id: string): Promise<boolean | string> {
    try {
      return await Message.findOneAndDelete({_id: id}) || 'success';
    } catch (error) {
      logger.error(error);
      throw new Error('mongo chat->messages->deleteMessage service error');
    }
  }
}