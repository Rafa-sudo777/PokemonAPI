//
//  EnityPokemon.swift
//  ConectionService
//
//  Created by Rafael Aviles Puebla on 18/06/21.
//
final class SearchPokemonEntity {
    var interactor: EntityOutputProtocol?
    var title: String?
    var description: String?
    
    init() {
    }
    convenience init(title: String, description: String) {
        self.init()
        self.title = title
        self.description = description
    }
    func completeData(pokemon: Pokemon) -> [SearchPokemonEntity] {
        var dataSource: [SearchPokemonEntity] = []
        dataSource = [SearchPokemonEntity(title: "Name", description: "\(pokemon.pokemonName)"),
                      SearchPokemonEntity(title: "Type", description: "\(pokemon.pokemonTypes)")]
        return dataSource
    }
}
extension SearchPokemonEntity: EntityInputProtocol {
    func fillData(response: Pokemon) {
        interactor?.sendFilledData(data: completeData(pokemon: response))
    }
}

enum ErrorType: Error {
    case failed
}
