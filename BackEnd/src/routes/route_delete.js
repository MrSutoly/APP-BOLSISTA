import express from 'express';
import pool from '../data/db.js';

const router = express.Router();

router.delete('/:id', async (req, res) => {
  try {
    const query = "DELETE FROM bolsistas WHERE id = ?";
    const [result] = await pool.query(query, [req.params.id]);
    if (result.affectedRows === 0) return res.status(404).json({ error: "Bolsista não encontrado" });
    res.json({ message: "Bolsista removido com sucesso" });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

export default router;