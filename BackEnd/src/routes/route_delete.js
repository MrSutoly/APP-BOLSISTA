import express from 'express';
import pool from '../data/db.js';
import fs from 'fs';
import path from 'path';

const router = express.Router();

router.delete('/:id', async (req, res) => {
  try {

    const [currentBolsista]= await pool.query(
      "SELECT comprovante FROM bolsistas WHERE id = ?",
      [req.params.id]
    );

    if(currentBolsista.length === 0){
      return res.status(404).json({ error: "Bolsista não encontrado" });
    }

    if (currentBolsista[0].comprovante && currentBolsista[0].comprovante !== '') {

      const comprovantePath = path.join(process.cwd(), 'uploads', currentBolsista[0].comprovante);
      
      if (fs.existsSync(comprovantePath)) {
        try {
          fs.unlinkSync(comprovantePath);
          console.log('Arquivo excluído:', comprovantePath);
        } catch (e) {
          console.error('Erro ao excluir arquivo:', e);
        }
      } else {
        console.log('Arquivo não encontrado:', comprovantePath);
      }
    } else {
      console.log('Bolsista não possui comprovante para excluir');
    }
    

    const query = "DELETE FROM bolsistas WHERE id = ?";
    const [result] = await pool.query(query, [req.params.id]);
    if (result.affectedRows === 0) return res.status(404).json({ error: "Bolsista não encontrado" });
    res.json({ message: "Bolsista removido com sucesso" });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

export default router;