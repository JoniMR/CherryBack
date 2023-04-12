import { Table, Column, Model } from "sequelize-typescript";
import { STRING, NUMBER } from "sequelize";
import { CryptoPojo } from "./crypto.model";
import { UserPojo } from "./user.model";
import { BelongsTo } from "sequelize-typescript";
import { ForeignKey } from "sequelize-typescript";

@Table({
  freezeTableName: true,
  schema: 'cherrytrade',
  tableName: "users_cryptos",
  createdAt: false,
  updatedAt: false
})
export class UsersCryptosPojo extends Model {
  @Column({
    primaryKey: true,
    type: STRING,
    field: 'user_crypto_id'
  })
  user_crypto_id: string

  @Column({
    type: NUMBER,
    field: 'amount'
  })
  amount: number

  @ForeignKey(() => CryptoPojo)
  @Column({
    type: STRING,
    field: 'crypto_id'
  })
  crypto_id: string

  @ForeignKey(() => UserPojo)
  @Column({
    type: STRING,
    field: 'user_id'
  })
  user_id: string

  @BelongsTo(() => CryptoPojo)
  crypto: CryptoPojo;

  @BelongsTo(() => UserPojo)
  user: UserPojo;
}