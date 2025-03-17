import { NextFunction, Request, Response } from 'express'
import { z, ZodError } from "zod"

const phoneRegex = new RegExp(
  /^([+]?[\s0-9]+)?(\d{3}|[(]?[0-9]+[)])?([-]?[\s]?[0-9])+$/
);

const validation = async (req: Request, res: Response, next: NextFunction) => {
  const schemaRegister = z.object({
    phone: z.string().regex(phoneRegex, 'Invalid Number!'),
    password: z.string().min(6).max(100),
  })
  try {
    schemaRegister.parse(req.body);
    next();
  } catch (error) {
    if (error instanceof ZodError) {
      const errorMessages = error.errors.map((issue: any) => ({
        message: `${issue.path.join('.')} is ${issue.message}`,
      }))
      res.status(400).json({ error: 'ZOD Invalid data', details: errorMessages });
    } else {
      res.status(500).json({ error: 'ZOD Internal Server Error' });
    }
  }
}

export const authValidation = validation;