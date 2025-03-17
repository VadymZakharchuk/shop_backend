import { prisma } from "@/server";
import { logger } from "@/utils/log";
import { Users, Prisma } from "@prisma/client";

export class AuthService {

  static async isPhoneExist (creds: Pick<Users, 'phone'>) {
    try {
      return await prisma.users.findUnique({
        where: {
          phone: creds.phone,
        }
      })
    }
    catch (e) {
      logger.error(e);
      throw new Error('isPhoneExist service error');
    }
  }

  static async login (creds: Pick<Users, 'phone'>) {
    try {
      return await prisma.users.findUnique({
        where: {
          phone: creds.phone,
        }
      })
    }
    catch (e) {
      logger.error(e);
      throw new Error('login service error');
    }
  }
  static async signUp (creds: Pick<Users, 'email' | 'phone' | 'password'>) {
    let userData: Prisma.UsersCreateInput
    userData = {
      name: '',
      email: creds.email,
      phone: creds.phone,
      password: creds.password,
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