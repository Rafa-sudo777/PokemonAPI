//
//  SearchPokemonEntity.swift
//  ConectionService
//
//  Created by Rafael Aviles Puebla on 18/06/21.
//
struct Pokemon: Decodable {
    
    let pokemonName: String
    let pokemonTypes: [Type]
    
    enum CodingKeys: String, CodingKey {
        case pokemonName = "name"
        case pokemonType = "types"
    }
    init(from decoder: Decoder) throws {
        let containter = try decoder.container(keyedBy: CodingKeys.self)
        self.pokemonName = try containter.decode(String.self, forKey: .pokemonName)
        self.pokemonTypes = try containter.decode([Type].self, forKey: .pokemonType)
    }
}

struct Type: Decodable {
    let type: Species
}

struct Species: Decodable {
    let name: String
}

