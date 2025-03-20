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
export const ordersRouter = router;