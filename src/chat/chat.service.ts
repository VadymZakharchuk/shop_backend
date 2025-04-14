import {logger} from "@/utils/log";
import {mongo} from "@/server";
import type {Chat} from "@/chat/typesChat";
import {ObjectId} from "mongodb";

export class ChatService {
  async getAll(query: object) {
    const db = mongo.db('chat')
    const colChat = db.collection<Chat[]>('messages')
    try {
      const cursor = colChat.find({...query});
      return await cursor.toArray();
    }
    catch (e) {
      logger.error(e);
      throw new Error('mongo chat->messages->getAll service error');
    }
  }

  async updateMessage(query: Partial<Chat> & { _id: string }) {
    if (!query || !('_id' in query) || !query._id) return new Error('mongo chat->messages->updateMessage missed _id')
    const db = mongo.db('chat')
    const colChat = db.collection<Chat>('messages')
    const filter = { _id:  new ObjectId(query._id) }
    delete (query as any)._id
    const updateDoc = {
      $set: {
        ...query,
        'updatedAt': new Date(),
      }
    }
    try {
      return colChat.updateOne(filter, updateDoc);
    }
    catch (e) {
      logger.error(e);
      throw new Error('mongo chat->messages->getAll service error');
    }
  }
  async createMessage(data: Omit<Chat, '_id' | 'createdAt' | 'updatedAt'>): Promise<Chat> {
    const db = mongo.db('chat');
    const colChat = db.collection<Chat>('messages');

    const newMessage: Chat = {
      _id: new ObjectId(),
      room: data.room || 'common',
      message: data.message,
      files: data.files || '',
      createdAt: new Date(),
      updatedAt: new Date(),
    };

    try {
      await colChat.insertOne(newMessage);
      return newMessage;
    } catch (error) {
      logger.error(error);
      throw new Error('mongo chat->messages->createMessage service error');
    }
  }
  async deleteMessage(id: string): Promise<boolean> {
    const db = mongo.db('chat');
    const colChat = db.collection<Chat>('messages');

    try {
      const result = await colChat.deleteOne({ _id: new ObjectId(id) });
      return result.deletedCount === 1;
    } catch (error) {
      logger.error(error);
      throw new Error('mongo chat->messages->deleteMessage service error');
    }
  }
}