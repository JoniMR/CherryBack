import { UserService } from "../services/user.service";
import logger from "../utils/logger";

const userService: UserService = new UserService();

export const userController = {
  getAllUsers: (_req: any, res: any) => {
    userService
      .getAllUsers()
      .then((result) => {
        res.json(result);
      })
      .catch((excepcion) => {
        console.error(excepcion);
        res.send(500);
      });
  },

  getUserById: (req: any, res: any) => {
    try {
      const userId = req.params.id;
      userService.getUserById(userId).then((result) => {
        res.json(result);
      });
    } catch (excepcion) {
      console.log(excepcion);
      res.sendStatus(500);
    }
  },

  addUser: (req: any, res: any) => {
    try {
      const newUser = req.body;
      userService.addUser(newUser).then((result) => {
        res.json(result);
        logger.info('Registered user')
      });
    } catch (excepcion) {
      console.log(excepcion);
      res.sendStatus(500);
    }
  },

  updateUser: (req: any, res: any) => {
    try {
      const newUser = req.body;
      userService.updateUser(newUser).then((result) => {
        res.json(result);
      });
    } catch (excepcion) {
      console.log(excepcion);
      res.sendStatus(500);
    }
  },

  getUserbyEmailAndPassword: (req: any, res: any) => {
    const email = req.body.email
    const password = req.body.password
    userService
      .getUserbyEmailAndPassword(email,password)
      .then((result) => {
        res.json(result);
        logger.info('[CLIENT]: Logged user');
      })
      .catch((excepcion) => {
        console.error(excepcion);
        res.send(500);
      });
  },

  getUserCryptoById : (req: any, res: any) => {
    try {
      const userId = req.params.id;
      console.log(userId);
      userService.getUserCryptoById(userId).then(result => {
        res.json(result);
      });
    } catch (excepcion) {
      console.log(excepcion);
      res.sendStatus(500);
    }
  },
};
