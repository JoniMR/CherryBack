import { userscryptosController } from './../controllers/userscryptos.controller';
import express from 'express'

const router = express.Router()

router.get('/get/all', userscryptosController.getAllUsersCryptos)           // Funciona
router.get('/get/:id', userscryptosController.getUserCryptosById)          // Funciona
router.post('/add', userscryptosController.addUsersCryptos)                 // Funciona
router.put('/update', userscryptosController.updateUsersCryptos)            // Funciona

export default router
module.exports = router
