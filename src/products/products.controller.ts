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
    const products: Products[] = await productsService.getProductOne(req.params.id);
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
    const id = parseInt(req.params.id);
    const user = await productsService.updateProduct(id, req.body);
    res.status(201).json(user);
  }
)

router.delete('/:id',
  async (req, res) => {
    const id = parseInt(req.params.id);
    await productsService.deleteProduct(id);
    res.status(204).send();
  })
export const productsRouter = router;