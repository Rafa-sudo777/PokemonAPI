//
//  InteractorPokemon.swift
//  ConectionService
//
//  Created by Rafael Aviles Puebla on 18/06/21.
//
import Foundation

final class SearchInteractor {
    var presenter: InteractorOutputProtocol?
    var entity: EntityInputProtocol?
    
    private func fetch(with url: String, complition: @escaping(Result<Data, ErrorType>) -> Void) {
        guard let url = URL(string: url) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                complition(.failure(.failed))
                return
            }
            if error == nil {
                complition(.success(data))
            } else {
                complition(.failure(.failed))
            }
        }
        task.resume()
    }
}
extension SearchInteractor: InteractorInputProtocol {
    func lookUpPokemon(pokemon name: String) {
        let endPoint = "https://pokeapi.co/api/v2/pokemon/" + name
        fetch(with: endPoint) { [weak self] result in
            switch result {
            case .success(let data):
                guard let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data) else { return }
                self?.entity?.fillData(response: pokemon)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
extension SearchInteractor: EntityOutputProtocol {
    func sendFilledData(data: [SearchPokemonEntity]) {
        presenter?.sendPokemonData(data: data)
    }
}
