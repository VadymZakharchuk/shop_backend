import Router from 'express';
import { CustomersService } from '@/customers/customers.service';
import type { ICustomer } from "src/mongoose/modelsTypes"
const router = Router();
const customersService = new CustomersService();

router.get('/',
  async (req, res) => {
  const customers: ICustomer[] = await customersService.getCustomers()
  res.status(200).json(customers)
})

router.post('/',
  async (req, res) => {
    const customer = req.body
    const newCustomer: ICustomer = await customersService.createCustomer(customer)
    res.status(201).json(newCustomer)
  }
)

router.put('/:id',
  async (req, res) => {
    const id = req.params.id
    const newCustomer: ICustomer = await customersService.updateCustomer(id, req.body)
    res.status(201).json(newCustomer)
  }
)

router.delete('/:id',
  async (req, res) => {
    const id = req.params.id
    await customersService.deleteCustomer(id)
    res.status(204).send()
  })
export const customersRouter = router;