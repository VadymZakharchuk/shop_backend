import { ColorsService } from "./colors.service";
import { Colors, PrismaClient } from "@prisma/client";

describe('TweetService', () => {
  const service = new ColorsService();
  const prisma = new PrismaClient()
  it('colors should be fetched', async () => {
    const colors: Colors[] = await service.getColors();
    expect(colors[0]).toHaveProperty("id");
    expect(colors[0]).toHaveProperty("name_uk");
  });
})