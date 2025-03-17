import Router from 'express';
import { UsersService } from '@/users/users.service';
import { Users } from "@prisma/client";

const router = Router();
const usersService = new UsersService();

router.get('/',
  async (req, res) => {
  const users: Users[] = await usersService.getUsers();
  res.status(200).json(users);
})

router.post('/',
  async (req, res) => {
    const user = req.body;
    const newUser = await usersService.createUser(user);
    res.status(201).json(newUser);
  }
)

router.put('/:id',
  async (req, res) => {
    const id = parseInt(req.params.id);
    const user = await usersService.updateUser(id, req.body);
    res.status(201).json(user);
  }
)

router.delete('/:id',
  async (req, res) => {
    const id = parseInt(req.params.id);
    await usersService.deleteUser(id);
    res.status(204).send();
  })
export const usersRouter = router;