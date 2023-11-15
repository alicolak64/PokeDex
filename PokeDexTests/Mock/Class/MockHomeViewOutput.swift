//
//  MockHomeViewOutput.swift
//  PokeDexTests
//
//  Created by Ali Çolak on 14.11.2023.
//

import XCTest
@testable import PokeDex

class MockHomeViewOutput : HomeViewModelDelegate {
    
    var pokemons : [PokeDex.PokemonDto] = []
    
    func updatePokemonList(pokemonList: [PokeDex.PokemonDto]) {
        self.pokemons = pokemonList
    }
    
    
}
