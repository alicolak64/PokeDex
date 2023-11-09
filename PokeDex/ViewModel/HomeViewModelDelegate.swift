//
//  PokemonViewModelOutput.swift
//  PokemonAPI
//
//  Created by Ali Çolak on 3.11.2023.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject{
    func updatePokemonList(pokemonList: [PokemonDto])
}
