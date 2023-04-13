import express from "express";
import logger from './utils/logger'
import cryptoRouter from './routes/crypto.routes';
import userRouter from './routes/user.routes';
import userscryptosRouter from './routes/userscryptos.routes';
import dotenv from 'dotenv'

dotenv.config()

const app = express()
const cors = require('cors')

app.use(express.json())

const PORT = 5000

const whiteList = ['http://localhost:4200']

app.use(cors({origin: whiteList}))

app.get("/ping", (_req, res) => {
  console.log("Se ha hecho un ping")
  res.send("Pong")
});

app.use('/api/crypto', cryptoRouter)
app.use('/api/user', userRouter)
app.use('/api/userscryptos', userscryptosRouter)

app.listen(PORT, () => {
  logger.info(`[SERVER]: Server is running at http://localhost:${PORT}`);
});