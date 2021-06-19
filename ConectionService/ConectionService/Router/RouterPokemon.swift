//
//  RouterPokemon.swift
//  ConectionService
//
//  Created by Rafael Aviles Puebla on 18/06/21.
//

final class SearchRouter {
    var view: SearchPokemonView
    var presenter: SearchPresenter?
    var interactor: SearchInteractor?
    var entity: SearchPokemonEntity?
    
    init() {
        view = SearchPokemonView()
        presenter = SearchPresenter()
        interactor = SearchInteractor()
        entity = SearchPokemonEntity()
        view.presenter = self.presenter
        presenter?.view = self.view
        presenter?.interactor = self.interactor
        interactor?.presenter = self.presenter
        interactor?.entity = self.entity
        entity?.interactor = self.interactor
        presenter?.router = self
    }
}
extension SearchRouter: RouterProtocol {
    func showDetail() {
        //
    }
}

