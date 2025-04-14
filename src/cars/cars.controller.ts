import Router from 'express';
import { CarsService } from '@/cars/cars.service';

const router = Router();
const colorsService = new CarsService();

router.get('/',
  async (req, res) => {
  const cars = await colorsService.getCars(req.body);
  res.status(200).json(cars);
})
export const carsRouter =router;