import { userController } from '../controllers/user.controller'
import express from 'express'

const router = express.Router()

router.get('/get/all', userController.getAllUsers)                 // Funciona
router.get('/get/:id', userController.getUserCryptoById)           // Funciona
router.post('/add', userController.addUser)                        // Funciona
router.put('/update', userController.updateUser)                   // Funciona
router.post('/login', userController.getUserbyEmailAndPassword)    // Funciona

export default router
module.exports = router


