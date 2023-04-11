import { userscryptosController } from './../controllers/userscryptos.controller';
import express from 'express'

const router = express.Router()

router.get('/get/all', userscryptosController.getAllUsersCryptos)           // Funciona
router.get('/get/:id', userscryptosController.getUsersCryptosById)          // Funciona
router.post('/add', userscryptosController.addUsersCryptos)
router.put('/update', userscryptosController.updateUsersCryptos)

export default router
module.exports = router
