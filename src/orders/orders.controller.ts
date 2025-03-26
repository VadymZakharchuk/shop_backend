import Router from 'express';
import { OrdersService } from "@/orders/orders.service";

const ordersService = new OrdersService();
const router = Router();

router.get('/',
  async (req, res) => {
    const orders = await ordersService.ordersList(req.query);
    res.status(200).json(orders);
  }
)

router.get('/:id', async (req, res) => {
  const orders = await ordersService.orderOne(req.params.id);
  res.status(200).json(orders);
})

router.post('/', async (req, res) => {
  const order = await ordersService.createOrder(req.body);
  res.status(201).json(order);
})

router.put('/:id', async (req, res) => {
  const orders = await ordersService.updateOne(req.params.id, req.body);
  res.status(200).json(orders);
})

router.put('/:id', async (req, res) => {
  const orders = await ordersService.deleteOne(req.params.id);
  res.status(200).json(orders);
})

router.put('/update/:id', async (req, res) => {
  const orders = await ordersService.updateOrder(req.body);
  res.status(200).json(orders);
})
export const ordersRouter = router;