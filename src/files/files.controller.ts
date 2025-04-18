import { Router, Request, Response } from "express"
import { FilesService } from "@/files/files.service"
import type { Multer } from "multer";
import multer from "multer";

const router = Router()

const storage = multer.memoryStorage();
const upload: Multer = multer({ storage });

export const filesRouter = (filesService: FilesService) => {
  router.post("/upload", upload.single("file"), async (req: Request, res: Response): Promise<void> => {
    const fileId = await filesService.uploadFile(req);
    if (fileId) {
      res.status(201).json({message: "File uploaded successfully", fileId: fileId});
    } else {
      res.status(500).json({error: "Failed to upload file to GridFS"});
    }
  });

  router.get("/:id", async (req: Request, res: Response) => {
    await filesService.getFileById(req.params.id, res);
  });

  router.get("/metadata/:id", async (req: Request, res: Response): Promise<void> => {
    const metadata = await filesService.getFileMetadataById(req.params.id);
    if (metadata) {
      res.status(200).json(metadata);
    } else {
      res.status(404).json({error: "File metadata not found"});
    }
  });

  router.delete("/:id", async (req: Request, res: Response): Promise<void> => {
    const deleted = await filesService.deleteFile(req.params.id);
    if (deleted) {
      res.status(200).json({message: "File deleted successfully"});
    } else {
      res.status(404).json({error: "File not found or failed to delete"});
    }
  });
  return router
}


