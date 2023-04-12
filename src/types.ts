export class CryptoDTO {
    crypto_id: string
    crypto_name: string
    value: number
    icon?: string
    asset: string
    stock: number
    category: string
}

export class UserDTO {
    user_id: string
    username: string
    surname1: string
    surname2?: string
    birthdate: Date
    email: string
    password: string
    img: string
    funds: number
    userscrypto?: UsersCryptosDTO[]
    cryptos?: CryptoDTO[]
}

export class UsersCryptosDTO {
    user_crypto_id: string
    user_id: string
    crypto_id: string
    amount: number
}
