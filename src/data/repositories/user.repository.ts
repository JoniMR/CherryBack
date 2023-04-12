import { UserPojo } from "../models/user.model";
import { connect } from "../config/user.db.config";
import { CryptoPojo } from "../models/crypto.model";
import { UsersCryptosPojo } from "../models/userscryptos.model";

export class UserRepository {
  _db: any = {};
  _userRepository: any;
  _cryptoRepository: any;
  _userscryptosRepository: any;

  constructor() {
    this._db = connect();
    this._userRepository = this._db.sequelize.getRepository(UserPojo);
    this._cryptoRepository = this._db.sequelize.getRepository(CryptoPojo);
    this._userscryptosRepository =
      this._db.sequelize.getRepository(UsersCryptosPojo);
  }

  async getAllUsers(): Promise<UserPojo[]> {
    try {
      const users = await this._userRepository.findAll();
      console.log("users:::", users);
      return users;
    } catch (error) {
      console.error(error);
      return [];
    }
  }

  async getUserById(id: number): Promise<UserPojo | undefined> {
    try {
      return await this._userRepository.findByPk(id);
    } catch (error) {
      console.error(error);
      return undefined;
    }
  }

  async addUser(newUser: UserPojo): Promise<number> {
    try {
      newUser = await this._userRepository.create(newUser);
      return newUser.id;
    } catch (error) {
      console.log(error);
      return -1;
    }
  }

  async updateUser(newUser: UserPojo): Promise<string> {
    try {
      newUser = await this._userRepository.update(newUser, {
        where: {
          user_id: newUser.user_id,
        },
      });
      return newUser.id;
    } catch (error) {
      console.error(error);
      return error.toString();
    }
  }

  async getUserbyEmailAndPassword(
    email: string,
    password: string
  ): Promise<UserPojo> {
    try {
      const user = await this._userRepository.findOne({
        where: {
          email: email,
          password: password,
        },
      });
      console.log("user:::", user);
      return user;
    } catch (error) {
      console.error(error);
      return error;
    }
  }

  async getUserCryptoById(id: string): Promise<UserPojo | undefined> {
    try {
      return this._userRepository.findOne({
        where: {
          user_id: id,
        },
        include: [
          {
            model: this._userscryptosRepository,
            include: [
              {
                model: this._cryptoRepository,
              },
            ],
          },
        ],
      });
    } catch (error) {
      console.error(error);
      return error;
    }
  }
}


