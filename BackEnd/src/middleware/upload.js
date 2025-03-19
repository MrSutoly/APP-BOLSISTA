import multer from 'multer';
import fs from 'fs';
import path from 'path';

const uploadDir = path.join(process.cwd(), 'uploads');
if (!fs.existsSync(uploadDir)) {
  fs.mkdirSync(uploadDir, { recursive: true });
}

const storage = multer.diskStorage({
  destination: function(req, file, cb) {
    cb(null, uploadDir);
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + '-' + file.originalname);
  }
});

const upload = multer({ 
  storage,
  fileFilter: function(req, file, cb) {
    if (file.mimetype === 'application/pdf' || 
        file.mimetype === 'image/jpeg') {
      cb(null, true);
    } else {
      cb(new Error('Formato de arquivo não suportado'), false);
    }
  },
  limits: {
    fileSize: 5 * 1024 * 1024 
  },
  onError: function(err, next) {
    console.log('Erro no upload:', err);
    next(err);
  }
});

export default upload;