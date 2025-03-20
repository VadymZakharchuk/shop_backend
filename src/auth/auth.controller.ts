import Router from "express";
import { authValidation } from "@/middleware/authValidation.middleware";
import { AuthService } from "@/auth/auth.service";
import jwt, { PrivateKey } from "jsonwebtoken";

const router = Router();

router.post('/login', authValidation,
  async (req, res): Promise<any> => {
    const creds = req.body;
    const authUser = await AuthService.login(creds);
    if (!authUser) {
      return res.status(401).json({ error: 'Invalid Credentials' });
    }
    const isPasswordCorrect = creds.password === authUser.password;
    if( !isPasswordCorrect) return res.status(401).json({ error: 'Invalid Credentials' });
    const jwtToken = jwt.sign(
        {
            user: authUser.email,
            userId: authUser.id,
            role: authUser.role
        },
        process.env.JWT_SECRET as PrivateKey,
        {
            expiresIn: "12h"
        })
    res.status(201).json({token: jwtToken, user:authUser });
})

router.post('/signup', authValidation,
  async (req, res): Promise<any> => {
    const creds = req.body;
    const authUser = await AuthService.isPhoneExist(creds);
    if (authUser) {
      return res.status(401).json({ error: 'such phone Number already exists' });
    }
    const newUser = await AuthService.signUp(creds);
    if (!newUser) {
      return res.status(401).json({ error: 'error creation of new user' });
    }
    const jwtToken = jwt.sign(
      {
        user: newUser.email,
        userId: newUser.id,
        role: newUser.role
      },
      process.env.JWT_SECRET as PrivateKey,
      {
        expiresIn: "24h"
      })
    res.status(201).json({token: jwtToken, user:newUser });
  })


export const authRouter = router;