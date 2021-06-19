//
//  ProtocolsPokemon.swift
//  ConectionService
//
//  Created by Rafael Aviles Puebla on 18/06/21.
//
protocol ViewProtocol {
    func loadPokemon(data: [SearchPokemonEntity])
}
protocol PresenterProtocol {
    func searchPokemon(pokemon name: String)
}
protocol InteractorInputProtocol {
    func lookUpPokemon(pokemon name: String)
}
protocol InteractorOutputProtocol {
    func sendPokemonData(data: [SearchPokemonEntity])
}
protocol RouterProtocol {
    func showDetail()
}
protocol EntityInputProtocol {
    func fillData(response: Pokemon)
}
protocol EntityOutputProtocol {
    func sendFilledData(data: [SearchPokemonEntity])
}
