import { ChatService } from '@/chat/chat.service';
import { io } from "@/server";
import type { Chat } from "@/chat/typesChat";
export const socketController = (socket: {
  id: any;
  on: (arg0: string, arg1: (data: Omit<Chat, 'createdAt' | 'updatedAt'>) => void) => void; }) => {

  console.log('User connected:', socket.id)
  const chatService = new ChatService()

  // Listen for incoming chat messages
  socket.on('chat:message', (data) => {
    console.log('Received message:', data)

    // Save the message to MongoDB
    // const message = chatService.createMessage(data);

    // Broadcast the message to all connected clients
    const room = data.room  || 'common'
    io.to(room).emit('chat message', data)
  });

  // Listen for user disconnection
  socket.on('disconnect', () => {
    console.log('User disconnected:', socket.id)
  })
}