export class CryptoDTO {
    crypto_id: string
    name: string
    value: number
    icon?: string
    asset: string
    stock: number
}

export class UserDTO {
    user_id: string
    username: string
    password: string
    email: string
    name: string
    surname1: string
    surname2?: string
    birthdate: Date
    funds: number
}

export class UsersCryptosDTO {
    user_id: string
    crypto_id: string
    amount: number
}
