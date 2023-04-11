import { cryptoController } from '../controllers/crypto.controller';
import express from 'express'

const router = express.Router()

router.get('/get/all', cryptoController.getAllCryptos)          // Funciona
router.get('/get/:id', cryptoController.getCryptoById)          // Funciona
router.post('/add', cryptoController.addCrypto)                 // Funciona
router.put('/update', cryptoController.updateCrypto)            // Funciona

export default router
module.exports = router
