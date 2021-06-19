//
//  PresenterPokemon.swift
//  ConectionService
//
//  Created by Rafael Aviles Puebla on 18/06/21.
//
final class SearchPresenter {
    var view: SearchPokemonView?
    var router: RouterProtocol?
    var interactor: InteractorInputProtocol?
}
extension SearchPresenter: PresenterProtocol {
    func searchPokemon(pokemon name: String) {
        interactor?.lookUpPokemon(pokemon: name)
    }
}
extension SearchPresenter: InteractorOutputProtocol {
    func sendPokemonData(data: [SearchPokemonEntity]) {
        view?.loadPokemon(data: data)
    }
}
