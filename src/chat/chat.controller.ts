import Router from 'express';
import { ChatService } from '@/chat/chat.service';

const router = Router();
const chatService = new ChatService();

router.get('/',
  async (req, res) => {
  const messages = await chatService.getAll(req.body);
  res.status(200).json(messages);
})

router.post('/',
  async (req, res) => {
    const messages = await chatService.createMessage(req.body);
    res.status(200).json(messages);
  })

router.put('/:id',
  async (req, res) => {
    const id = req.params.id
    const messages = await chatService.updateMessage(id, req.body);
    res.status(200).json(messages);
  })

router.delete('/:id',
  async (req, res) => {
    const messages = await chatService.deleteMessage(req.params.id);
    res.status(200).json(messages);
  })
export const chatRouter = router;