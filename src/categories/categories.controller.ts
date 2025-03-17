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

router.post('/',
  async (req, res) => {
  const category: Categories = req.body;
  const newCategory = await categoriesService.createCategory(category);
  res.status(201).json(newCategory);
})

router.put('/:id',
  async (req, res) => {
    const category: Categories = req.body;
    const newCategory = await categoriesService.updateCategory(req.params.id, category);
    res.status(201).json(newCategory);
  })

router.delete('/:id',
  async (req, res) => {
    const newCategory = await categoriesService.deleteCategory(req.params.id);
    res.status(201).json(newCategory);
  })
export const categoriesRouter = router;