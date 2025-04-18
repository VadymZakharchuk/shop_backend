import { Request, Response } from 'express';
import mongoose from 'mongoose';
import {Db, GridFSBucket, ObjectId} from 'mongodb';
import { Readable } from 'stream';

export class FilesService {
  private bucket: GridFSBucket;

  constructor() {
    this.bucket = new mongoose.mongo.GridFSBucket(mongoose.connection.db as Db, {
      bucketName: 'uploads',
    });
  }

  async uploadFile(req: Request): Promise<ObjectId | null> {
    if (!req.file) {
      console.error('No file uploaded in the request.');
      return null;
    }
    const userId = req.body.userId || 'anonymous'
    return new Promise((resolve, reject) => {
      const uploadStream = this.bucket.openUploadStream(req.file!.originalname, {
        contentType: req.file!.mimetype,
        metadata: {
          userId: userId,
          metadata: req.body.metadata ? JSON.parse(req.body.metadata) : {}
        }
      });

      const fileStream = Readable.from(req.file!.buffer);

      fileStream.pipe(uploadStream)
        .on('finish', () => {
          resolve(uploadStream.id);
        })
        .on('error', (error) => {
          console.error('Error uploading file to GridFS:', error);
          reject(error);
        });
    });
  }

  async getFileById(id: string, res: Response): Promise<void> {
    try {
      const fileId = new ObjectId(id);
      const downloadStream = this.bucket.openDownloadStream(fileId);
      const fileInfo = await this.bucket.find({ _id: fileId }).toArray();

      if (!fileInfo || fileInfo.length === 0) {
        res.status(404).json({ error: 'File not found' });
        return;
      }

      res.setHeader('Content-Type', fileInfo[0].contentType || 'application/octet-stream');
      downloadStream.pipe(res);
    } catch (error) {
      console.error('Error getting file by ID from GridFS:', error);
      res.status(500).json({ error: 'Failed to retrieve file' });
    }
  }

  async getFileMetadataById(id: string): Promise<any | null> {
    try {
      const fileId = new ObjectId(id);
      const fileInfo = await this.bucket.find({ _id: fileId }).toArray();
      if (!fileInfo || fileInfo.length === 0) {
        return null;
      }
      return fileInfo[0];
    } catch (error) {
      console.error('Error getting file metadata by ID from GridFS:', error);
      return null;
    }
  }

  async deleteFile(id: string): Promise<boolean> {
    try {
      const fileId = new ObjectId(id);
      await this.bucket.delete(fileId);
      console.log(`File with ID "${id}" deleted successfully from GridFS.`);
      return true;
    } catch (error) {
      console.error('Error deleting file from GridFS:', error);
      return false;
    }
  }
}
