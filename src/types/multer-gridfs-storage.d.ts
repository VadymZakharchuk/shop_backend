// types/multer-gridfs-storage.d.ts
declare module 'multer-gridfs-storage' {
  import { Request } from 'express';
  import { StorageEngine } from 'multer';
  import { Db } from 'mongodb';

  export interface FileInfo {
    filename: string;
    bucketName?: string;
    metadata?: any;
    chunkSizeBytes?: number;
    contentType?: string;
    aliases?: string[];
  }

  export interface GridFsStorageOptions {
    url?: string;
    db?: Db | Promise<Db>;
    file?: (
      req: Request,
      file: Express.Multer.File
    ) => Promise<FileInfo> | FileInfo;
    options?: any;
    cache?: boolean;
    id?: any;
  }

  // ⚠️ Без implements StorageEngine — чтобы избежать TS2739
  export class GridFsStorage {
    constructor(options: GridFsStorageOptions);
  }

  export default GridFsStorage;
}

