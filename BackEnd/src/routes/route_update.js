import express from 'express';
import pool from '../data/db.js';
import upload from '../middleware/upload.js'; 

const router = express.Router();

router.put('/:id', upload.single('file'), async (req, res) => {
  try {
    console.log('Body recebido:', req.body); 
    console.log('Arquivo recebido:', req.file);
    
   
    const [currentBolsista] = await pool.query(
      "SELECT nome_completo, data_nascimento, curso, comprovante FROM bolsistas WHERE id = ?", 
      [req.params.id]
    );
    
    if (currentBolsista.length === 0) {
      return res.status(404).json({ error: "Bolsista não encontrado" });
    }
    
    const nome_completo = req.body.nome_completo || currentBolsista[0].nome_completo;
    const data_nascimento = req.body.data_nascimento
    ? req.body.data_nascimento.split('T')[0] 
    : currentBolsista[0].data_nascimento;
    const curso = req.body.curso || currentBolsista[0].curso;
    let comprovante = req.file ? req.file.filename : currentBolsista[0].comprovante;

    console.log('Valores a serem atualizados:', {
      nome_completo,
      data_nascimento,
      curso,
      comprovante
    });

    const query = `
      UPDATE bolsistas 
      SET nome_completo = ?, data_nascimento = ?, curso = ?, comprovante = ? 
      WHERE id = ?
    `;
    const values = [nome_completo, data_nascimento, curso, comprovante, req.params.id];

    const [result] = await pool.query(query, values);

    if (result.affectedRows === 0) {
      return res.status(404).json({ error: "Falha na atualização" });
    }

    res.json({ id: req.params.id, nome_completo, data_nascimento, curso, comprovante });
  } catch (error) {
    console.error("Erro no backend:", error);
    res.status(500).json({ error: error.message });
  }
});
export default router;