import { NextFunction, Request, Response } from 'express'
import jwt from 'jsonwebtoken'

const authValidation = (req: Request, res: Response, next: NextFunction): any => {
  if ( !('authorization' in req.headers) ||
    req.headers.authorization === undefined ||
    !req.headers.authorization.includes('Bearer ')) {
    return res.status(401).json({
      message: "Authentication required"
    })
  }

  let token = req.headers.authorization
  token = token!.replace("Bearer ", "")
  req.body.userData = jwt.verify(token, process.env.JWT_SECRET as string);
  const nowMs = Date.now();
  const exp = req.body.userData.exp * 1000;
  if (nowMs - exp > 0) {
    return res.status(401).json({
      message: "Token expired"
    })
  }
  next();
}
// eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoidmFkeW0uemFraGFyY2h1a0BnbWFpbC5jb20iLCJ1c2VySWQiOjEsInJvbGUiOiJBRE1JTiIsImlhdCI6MTc0MjM2ODI2NiwiZXhwIjoxNzQyNDExNDY2fQ.XPlJSe0VCBb_cm8rqAAvtXF91pWlEjga4q0_ymbFiac
export const auth = authValidation;