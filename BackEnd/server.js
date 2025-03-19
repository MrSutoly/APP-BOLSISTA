import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import createRoute from './src/routes/route_create.js';
import readRoute from './src/routes/route_read.js';
import updateRoute from './src/routes/route_update.js';
import deleteRoute from './src/routes/route_delete.js';


dotenv.config();

const app = express();
const port = 3000;

app.use(cors());
app.use(express.json());
app.use('/uploads', express.static('uploads')); 

app.use('/', createRoute);
app.use('/bolsistas', readRoute);
app.use('/atualizar', updateRoute);
app.use('/deletar', deleteRoute);


app.listen(port, (error) => {
  if (error) {
    console.log('Deu erro mano');
    return;
  }
  console.log(`Servidor rodando na porta ${port}`);
});