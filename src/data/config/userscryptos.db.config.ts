import { Sequelize } from "sequelize-typescript";
import { UsersCryptosPojo } from "../models/userscryptos.model";
import { UserPojo } from "../models/user.model";
import { CryptoPojo } from "../models/crypto.model";

export const connect = () => {
    const DB_HOSTNAME = 'localhost'
    const DB_PORT = 5432
    const DB_NAME = 'crypto'
    const DB_USERNAME = 'admin'
    const DB_PASSWORD = 'admin'
    const DB_SCHEMA = 'cherrytrade'
    const DB_DIALECT : any = 'postgres'

    const sequelize = new Sequelize(DB_NAME, DB_USERNAME, DB_PASSWORD, {
        host: DB_HOSTNAME,
        dialect: DB_DIALECT,
        schema: DB_SCHEMA,
        port: DB_PORT,
        repositoryMode: true,
        pool: {
            max: 10,
            min: 0,
            acquire: 20000,
            idle: 5000
        }
    })

    sequelize.addModels([UsersCryptosPojo, UserPojo, CryptoPojo])
    const db : any = {}
    db.Sequelize = Sequelize
    db.sequelize = sequelize

    return db
}