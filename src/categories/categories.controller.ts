import Router from 'express';
import { Categories } from "@prisma/client";
import { CategoriesService } from '@/categories/categories.service';

const router = Router();
const categoriesService = new CategoriesService();

router.get('/',
  async (req, res) => {
    const categories: Categories[] = await categoriesService.getCategories();
    res.status(200).json(categories);
  }
)

router.get('/:level',
  async (req, res) => {
    const categories: Categories[] = await categoriesService.getCategoryTree(req.params.level);
    res.status(200).json(categories);
  }
)

export const categoriesRouter = router;