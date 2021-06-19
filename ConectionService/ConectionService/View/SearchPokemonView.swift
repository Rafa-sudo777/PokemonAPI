//
//  SearchPokemonView.swift
//  ConectionService
//
//  Created by Rafael Aviles Puebla on 18/06/21.
//

import UIKit

final class SearchPokemonView: UIViewController {
    var presenter: PresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func searchPressed(_ sender: Any) {
        presenter?.searchPokemon(pokemon: "charizard")
    }
}
extension SearchPokemonView: ViewProtocol {
    func loadPokemon(data: [SearchPokemonEntity]) {
        print(data)
    }
}
