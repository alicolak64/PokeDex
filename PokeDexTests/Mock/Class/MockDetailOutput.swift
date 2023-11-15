//
//  MockDetailOutput.swift
//  PokeDexTests
//
//  Created by Ali Çolak on 15.11.2023.
//

import XCTest
@testable import PokeDex

class MockDetailOutput : DetailViewModelDelegate {
    
    var pokemonId : Int?
    var pokemon : PokemonDetailExtensionDto?

    
    func updatePokemon(pokemon: PokeDex.PokemonDetailExtensionDto) {
        self.pokemon = pokemon
    }
    
    
}

