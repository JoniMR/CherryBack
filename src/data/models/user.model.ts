import { Table, Column, Model } from "sequelize-typescript";
import { STRING, NUMBER, DATE } from "sequelize";
import { v4 as uuid } from 'uuid';
import { UsersCryptosPojo } from "./userscryptos.model";
import { CryptoPojo } from "./crypto.model";
import { HasMany, BelongsToMany } from "sequelize-typescript";

@Table({
  freezeTableName: true,
  schema: 'cherrytrade',
  tableName: "users",
  createdAt: false,
  updatedAt: false
})
export class UserPojo extends Model {
  @Column({
    primaryKey: true,
    type: STRING,
    field: 'user_id'
  })
  user_id: string = uuid();

  @Column({
    type: STRING,
    field: 'username'
  })
  username: string

  @Column({
    type: STRING,
    field: 'surname1'
  })
  surname1: string

  @Column({
    type: STRING,
    field: 'surname2'
  })
  surname2: string

  @Column({
    type: DATE,
    field: 'birthdate'
  })
  birthdate: Date

  @Column({
    type: STRING,
    field: 'email'
  })
  email: string

  @Column({
    type: STRING,
    field: 'password'
  })
  password: string

  @Column({
    type: STRING,
    field: 'img'
  })
  img: string

  @Column({
    type: NUMBER,
    field: 'funds'
  })
  funds: number

  @HasMany(() => UsersCryptosPojo)
  userscrypto: UsersCryptosPojo[]

  @BelongsToMany(() => CryptoPojo, () => UsersCryptosPojo)
  cryptos: CryptoPojo[];
}