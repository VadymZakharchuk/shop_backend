import Router from 'express';
import { ColorsService } from '@/colors/colors.service';

const router = Router();
const colorsService = new ColorsService();

router.get('/',
  async (req, res) => {
  const colors = await colorsService.getColors();
  res.status(200).json(colors);
})

router.post('/',
  async (req, res) => {
    const color = req.body;
    const newColor = await colorsService.createColor(color);
    res.status(201).json(newColor);
  }
)

router.put('/:id',
  async (req, res) => {
    const id = parseInt(req.params.id);
    const color = await colorsService.updateColor(id, req.body);
    res.status(201).json(color);
  }
)

router.delete('/:id',
  async (req, res) => {
    const id = parseInt(req.params.id);
    await colorsService.deleteColor(id);
    res.status(204).send();
  })
export const colorsRouter =router;