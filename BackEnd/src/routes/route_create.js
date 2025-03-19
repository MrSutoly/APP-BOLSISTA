import express from 'express';
import pool from '../data/db.js'; 
import upload from '../middleware/upload.js';

const router = express.Router();

router.post('/bolsista', upload.single('file'), async (req, res) => {
  try {
    const { nome_completo, data_nascimento, curso } = req.body;
    const comprovante = req.file ? req.file.filename : null;
    const query = "INSERT INTO bolsistas (nome_completo, data_nascimento, curso, comprovante) VALUES (?, ?, ?, ?)";
    const values = [nome_completo, data_nascimento, curso, comprovante];
    const [result] = await pool.query(query, values);
    res.status(201).json({ id: result.insertId, nome_completo, data_nascimento, curso, comprovante });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

export default router;