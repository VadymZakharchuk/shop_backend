import Customer from "src/mongoose/models/Customer";
import type { ICustomer } from "src/mongoose/modelsTypes"
import { logger } from "@/utils/log";

export class CustomersService {
  async getCustomers(): Promise<ICustomer[]> {
    try {
      return await Customer.find()
    }
    catch (e) {
      logger.error(e);
      throw new Error('getCustomers service error')
    }
  }

  async createCustomer(customerData: ICustomer): Promise<ICustomer> {
    try {
      if (!('role' in customerData)) customerData.role='client'
      const customer = new Customer(customerData)
      await customer.save()
      return customerData
    }
    catch (e) {
      logger.error(e);
      throw new Error('createUser service error')
    }
  }

  async updateCustomer(id: string, customerData: ICustomer): Promise<ICustomer> {
    try {
      await Customer.findOneAndUpdate({ _id: id }, customerData, { new: true })
      return customerData
    }
    catch (e) {
      logger.error(e);
      throw new Error('updateCustomer service error');
    }
  }

  async deleteCustomer(id: string): Promise<ICustomer | string> {
    try {
      return await Customer.findOneAndDelete({_id: id}) || 'success'
    }
    catch (e) {
      logger.error(e);
      throw new Error('deleteCustomer service error');
    }
  }
}