import { prisma } from "@/server";
import { Users} from "@prisma/client";
import { logger } from "@/utils/log";

export class UsersService {
  getUsers(): Promise<Users[]> {
    try {
      return prisma.users.findMany()
    }
    catch (e) {
      logger.error(e);
      throw new Error('getUsers service error');
    }
  }

  createUser(user: Users): Promise<Users> {
    try {
      return prisma.users.create({ data: user });
    }
    catch (e) {
      logger.error(e);
      throw new Error('createUser service error');
    }
  }

  updateUser(id: number, user: Users): Promise<Users> {
    try {
      return prisma.users.update({ where: { id }, data: user });
    }
    catch (e) {
      logger.error(e);
      throw new Error('updateUser service error');
    }
  }

  deleteUser(id: number): Promise<Users> {
    try {
      return prisma.users.delete({ where: { id } });
    }
    catch (e) {
      logger.error(e);
      throw new Error('deleteUser service error');
    }
  }
}