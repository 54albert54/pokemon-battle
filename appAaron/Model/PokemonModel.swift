//
//  PokemonModel.swift
//  appAaron
//
//  Created by Angel alberto Bernechea on 5/29/24.
//

import Foundation

//{
//  "name": "charmander",
//  "tipe": "fuego",
//  "hp": 100,
//  "attack": {
//    "first": "lanza llamas",
//    "second": "speed"
//  },
// "sprites": {
//  "front":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png",
//  "back":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/4.png"
//
// },
// "isalive": true
//}

// MARK: - Pokemon
// Define la estructura de Pokemon
struct Pokemon:Identifiable {
    var id = UUID().uuidString
    var name: String
    var type: TypesPokemon
    var hp: Int
    var maxHp: Int
    var attack: Attack
    var sprites: [[String:String]]
    var islive: Bool
    var isAttacking: Bool
    
    // Un Pokémon de ejemplo
    static var dummyPokemon: Pokemon =
        Pokemon(name: "charmander",
                type: .fire,
                hp: 100,
                maxHp: 100,
                attack: Attack(first: "lanza llamas", second: "speed"),
                sprites: [["front":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png"],
                          ["back": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/4.png"]],
                islive: true, isAttacking: false)
    // Un Pokémon de ejemplo
    static var dummyPokemonEnemy: Pokemon =
        Pokemon(name: "bolvasour",
                type: .grass,
                hp: 100,
                maxHp: 100,
                attack: Attack(first: "Latigo sepa", second: "leer"),
                sprites: [["front":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png"],
                          ["back": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png"]],
                islive: true ,isAttacking: false)
}


// MARK: - Attack
struct Attack: Codable {
    let first, second: String
}

// MARK: - Sprites
struct Sprites: Codable {
    let front, back: String
}

enum TypesPokemon: Encodable {
    case fire , grass , wather
}
