import Router from 'express';
import { StockService } from "@/stock/stock.service";

const router = Router();
const stockService = new StockService();

router.get('/',
  async (req, res) => {
    const stock = await stockService.stockList(req.query);
    res.status(200).json(stock);
  }
)

router.get('/:id',
  async (req, res) => {
    const stockItem = await stockService.stockOne(req.params.id);
    res.status(200).json(stockItem);
  }
)

router.post('/',
  async (req, res) => {
    const stockItem = await stockService.createOne(req.body);
    res.status(201).json(stockItem);
  }
)

router.put('/:id',
  async (req, res) => {
    const stockItem = await stockService.updateOne(req.params.id, req.body);
    res.status(201).json(stockItem);
  }
)

router.delete('/:id',
  async (req, res) => {
    const stockItem = await stockService.deleteOne(req.params.id);
    res.status(201).json(stockItem);
  }
)
export const stockRouter = router;