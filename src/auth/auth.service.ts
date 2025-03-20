import { prisma } from "@/server";
import { logger } from "@/utils/log";
import { Users, Prisma } from "@prisma/client";

export class AuthService {

  static async isPhoneExist (credits: Pick<Users, 'phone'>) {
    try {
      return await prisma.users.findUnique({
        where: {
          phone: credits.phone,
        }
      })
    }
    catch (e) {
      logger.error(e);
      throw new Error('isPhoneExist service error');
    }
  }

  static async login (credits: Pick<Users, 'phone'>) {
    try {
      return await prisma.users.findUnique({
        where: {
          phone: credits.phone,
        }
      })
    }
    catch (e) {
      logger.error(e);
      throw new Error('login service error');
    }
  }
  static async signUp (credits: Pick<Users, 'email' | 'phone' | 'password'>) {
    let userData: Prisma.UsersCreateInput
    userData = {
      name: '',
      email: credits.email,
      phone: credits.phone,
      password: credits.password,
      countOrders: 0,
      countVisits: 0,
      role: 'CLIENT',
      address:  { "country" : 'Ukraine' },
    }
    try {
      return await prisma.users.create({ data: userData }) as Users
    }
    catch (e) {
      logger.error(e);
      throw new Error('login service error');
    }
  }
}