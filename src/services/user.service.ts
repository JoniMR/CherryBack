import { UserRepository } from "../data/repositories/user.repository";
import { UserPojo } from "../data/models/user.model";
import { UsersCryptosPojo } from "../data/models/userscryptos.model";
import { UserDTO } from "../types";
import { CryptoDTO } from "../types";
import { UsersCryptosDTO } from "../types";
import { CryptoPojo } from "../data/models/crypto.model";

export class UserService {
  _userRepository: UserRepository;

  constructor() {
    this._userRepository = new UserRepository();
  }

  async getAllUsers(): Promise<UserDTO[]> {
    const usersPromise = await this._userRepository
      .getAllUsers()
      .then((usersAsPojo) => {
        let usersAsDTO: UserDTO[] = [];
        usersAsPojo.forEach((userAsPojo) => {
          let userAsDTO = this.parsePojoIntoDTO(userAsPojo);
          usersAsDTO.push(userAsDTO);
        });
        return usersAsDTO;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return usersPromise;
  }

  async getUserById(id: any): Promise<UserDTO | undefined> {
    const userPromise = await this._userRepository
      .getUserById(id)
      .then((userAsPojo) => {
        if (!!userAsPojo) {
          return this.parsePojoIntoDTO(userAsPojo);
        } else return undefined;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return userPromise;
  }

  async addUser(user: UserDTO): Promise<number> {
    const userPojo: UserPojo = this.parseDTOIntoPojo(user);
    const userPromise = await this._userRepository
      .addUser(userPojo)
      .then((user_id) => {
        return user_id;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return userPromise;
  }

  async updateUser(user: UserDTO): Promise<any> {
    const cryptoPojo: UserPojo = this.parseDTOIntoPojo(user);
    const cryptoPromise = await this._userRepository
      .updateUser(cryptoPojo)
      .then((user_id) => {
        return user_id;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return cryptoPromise;
  }

  async getUserbyEmailAndPassword(
    email: string,
    password: string
  ): Promise<UserDTO> {
    const usersPromise = await this._userRepository
      .getUserbyEmailAndPassword(email, password)
      .then((userAsPojo) => {
        let userAsDTO = this.parsePojoIntoDTO(userAsPojo);
        return userAsDTO;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return usersPromise;
  }

  async getUserCryptoById(user_id: string): Promise<UserDTO | undefined> {
    const userPromise = await this._userRepository
      .getUserCryptoById(user_id)
      .then(userAsPojo =>{
        if(!!userAsPojo) {
          console.log(userAsPojo)
          return this.parsePojoIntoDTO(userAsPojo)
        }
        else
            return undefined 
        }) .catch(error=>{
            console.log(error)
            throw error
    })
    return userPromise
  }

  parsePojoIntoDTO(userPojo: UserPojo): UserDTO {
    const userDTO: UserDTO = {
      user_id: userPojo.dataValues.user_id,
      username: userPojo.dataValues.username,
      surname1: userPojo.dataValues.surname1,
      surname2: userPojo.dataValues.surname2,
      birthdate: userPojo.dataValues.birthdate,
      email: userPojo.dataValues.email,
      password: userPojo.dataValues.password,
      img: userPojo.dataValues.img,
      funds: userPojo.dataValues.funds,
      userscrypto: [],
      cryptos: [],
    };

    if(!!userPojo.dataValues.userscrypto && userPojo.dataValues.userscrypto.length > 0){
      userPojo.dataValues.userscrypto.forEach((usercrypto: UsersCryptosPojo) => {  
        const usercryptoDTO : UsersCryptosDTO ={
          user_crypto_id: usercrypto.dataValues.user_crypto_id,
          user_id: usercrypto.dataValues.user_id,
          crypto_id: usercrypto.dataValues.crypto_id,
          amount: usercrypto.dataValues.amount,
        }
        userDTO.userscrypto.push(usercryptoDTO)
      })
    }

    if(!!userPojo.dataValues.cryptos && userPojo.dataValues.cryptos.length > 0){
      userPojo.dataValues.cryptos.forEach((crypto: CryptoPojo) => {  
        const cryptoDTO : CryptoDTO ={
          crypto_id: crypto.dataValues.crypto_id,
          crypto_name: crypto.dataValues.crypto_name,
          value: crypto.dataValues.value,
          icon: crypto.dataValues.icon,
          asset: crypto.dataValues.asset,
          stock: crypto.dataValues.stock,
          category: crypto.dataValues.category,
        }
        userDTO.cryptos.push(cryptoDTO)
      })
    }

    return userDTO;
  }

  parseDTOIntoPojo(userDTO: UserDTO): UserPojo {
    return userDTO as UserPojo;
  }
}
