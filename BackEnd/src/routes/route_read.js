import express from 'express';
import pool from '../data/db.js'; 

const router = express.Router();

router.get('/', async (req, res) => {
  try {
    const query = "SELECT * FROM bolsistas";
    const [rows] = await pool.query(query);
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

router.get('/:id', async (req, res) => {
  try {
    const [rows] = await pool.query("SELECT * FROM bolsistas WHERE id = ?", [req.params.id]);
    if (rows.length === 0) return res.status(404).json({ error: "Bolsista não encontrado" });
    res.json(rows[0]);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});


router.get('/:id/comprovante', async (req, res) => {
  try {
    const [rows] = await pool.query("SELECT comprovante FROM bolsistas WHERE id = ?", [req.params.id]);
    if (rows.length === 0) return res.status(404).json({ error: "Bolsista não encontrado" });
    const comprovante = rows[0].comprovante;
    if (!comprovante) return res.status(404).json({ error: "Comprovante não encontrado" });
    res.json({ comprovanteUrl: `/uploads/${comprovante}` });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

export default router;