import { Table, Column, Model } from "sequelize-typescript";
import { STRING, NUMBER } from "sequelize";
import { UsersCryptosPojo } from "./userscryptos.model";
import { HasMany, BelongsToMany } from "sequelize-typescript";
import { UserPojo } from "./user.model";
@Table({
  freezeTableName: true,
  schema: 'cherrytrade',
  tableName: "cryptos",
  createdAt: false,
  updatedAt: false
})
export class CryptoPojo extends Model {
  @Column({
    primaryKey: true,
    type: STRING,
    field: 'crypto_id'
  })
  crypto_id: string

  @Column({
    type: STRING,
    field: 'crypto_name'
  })
  crypto_name: string

  @Column({
    type: NUMBER,
    field: 'value'
  })
  value: number

  @Column({
    type: STRING,
    field: 'icon'
  })
  icon: string

  @Column({
    type: STRING,
    field: 'asset'
  })
  asset: string

  @Column({
    type: NUMBER,
    field: 'stock'
  })
  stock: number
  
  @Column({
    type: STRING,
    field: 'category'
  })
  category: string

  @HasMany(() => UsersCryptosPojo)
  userscrypto: UsersCryptosPojo[]

  @BelongsToMany(() => UserPojo, () => UsersCryptosPojo)
  users: UserPojo[];
}
