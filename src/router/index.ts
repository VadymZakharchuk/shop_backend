import { Router } from "express";
import { authRouter } from "@/auth/auth.controller";
import { colorsRouter } from "@/colors/colors.controller";
import { usersRouter } from "@/users/users.controller";
import { productsRouter } from "@/products/products.controller";
import { categoriesRouter } from "@/categories/categories.controller";
import { stockRouter } from "@/stock/stock.controller";
import { ordersRouter } from "@/orders/orders.controller";
import { chatRouter } from "@/chat/chat.controller";
import { customersRouter } from "@/customers/customers.controller";

const router = Router();

router.use("/auth", authRouter);
router.use("/chat", chatRouter);
router.use("/colors", colorsRouter);
router.use("/customers", customersRouter);
router.use("/users", usersRouter);
router.use("/products", productsRouter);
router.use("/categories", categoriesRouter);
router.use("/stock", stockRouter);
router.use("/orders", ordersRouter);
router.use("/customers", customersRouter);

export const apiRouter = router;