import Router from 'express';
import { ProductsService } from '@/products/products.service';
import { Products } from "@prisma/client";

const router = Router();
const productsService = new ProductsService();

router.get('/',
  async (req, res) => {
  const products: Products[] = await productsService.getProducts();
  res.status(200).json(products);
})

router.get('/:id',
  async (req, res) => {
    const products: Products | null = await productsService.getProductOne(req.params.id);
    if (!products) {
      res.status(404).send('Product not found');
      return;
    }
    res.status(200).json(products);
  })

router.post('/',
  async (req, res) => {
    const product = req.body;
    const newProduct = await productsService.createProduct(product);
    res.status(201).json(newProduct);
  }
)

router.put('/:id',
  async (req, res) => {
    const user = await productsService.updateProduct(req.params.id, req.body);
    res.status(201).json(user);
  }
)

router.delete('/:id',
  async (req, res) => {
    await productsService.deleteProduct(req.params.id);
    res.status(204).send();
  })
export const productsRouter = router;