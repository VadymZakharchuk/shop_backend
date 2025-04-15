import { Request } from 'express';
import crypto from 'crypto';
import path from 'path';
import multer from 'multer';
import { GridFsStorage, FileInfo } from 'multer-gridfs-storage';

const url = process.env.MONGODB_URL || 'mongodb://localhost:27017/shop';

const storage = new GridFsStorage({
  url,
  file: (req: Request, file): Promise<FileInfo> => {
    return new Promise((resolve, reject) => {
      crypto.randomBytes(16, (err, buf) => {
        if (err) return reject(err);

        const filename = buf.toString('hex') + path.extname(file.originalname);
        const fileInfo: FileInfo = {
          filename,
          bucketName: 'uploads',
        };

        resolve(fileInfo);
      });
    });
  }
});

export const upload = multer({ storage: storage  as unknown as multer.StorageEngine})