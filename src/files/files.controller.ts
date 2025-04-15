import { Router } from 'express'
import { Request, Response } from 'express'
import { FilesService } from "@/files/files.service";
import { upload } from "@/mongoose/gridfsStorage";
const router = Router();
const filesService = new FilesService();

router.post('/upload', upload.single('file'), filesService.uploadFile)

router.get('/file/:filename', async (req: Request, res: Response) => {
  await filesService.getFile(req, res)
})

router.delete('/file/:filename', async (req: Request, res: Response) => {
  await filesService.deleteFile(req, res)
})
export const filesRouter = router