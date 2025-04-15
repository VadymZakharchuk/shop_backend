import { Request, Response } from 'express'
import mongoose from "mongoose";
import Grid from "gridfs-stream";
import { gfs } from "@/mongoose/gridfs";
export class FilesService {
  async uploadFile(req: Request, res: Response): Promise<void> {
    if (!req.file) {
      res.status(400).json({ error: 'No file uploaded' })
      return
    }

    res.status(200).json({
      message: 'File uploaded successfully',
      file: req.file,
    });
  }

  async getFile(req: Request, res: Response): Promise<void> {
    try {
      const file = await gfs.files.findOne({ filename: req.params.filename });

      if (!file) {
        res.status(404).json({ error: 'File not found' });
        return;
      }

      const readStream = gfs.createReadStream(file.filename);
      res.set('Content-Type', file.contentType || 'application/octet-stream');
      readStream.pipe(res);
    }
    catch (err) {
      res.status(500).json({ error: 'Error fetching file' });
    }
  }

  async deleteFile(req: Request, res: Response): Promise<void> {
    try {
      gfs.remove({ filename: req.params.filename, root: 'uploads' }, (err) => {
        if (err) return res.status(500).json({ error: err.message });
        res.status(200).json({ message: 'File deleted' });
      });
    }
    catch (err) {
      res.status(500).json({ error: 'Error deleting file' });
    }
  }
}