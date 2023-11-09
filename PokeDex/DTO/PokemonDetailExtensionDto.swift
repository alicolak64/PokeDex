
//  SpeciesDto.swift
//  PokemonAPI
//
//  Created by Ali Çolak on 3.11.2023.
//

import UIKit

struct PokemonDetailExtensionDto {
    
    var pokemonDetailDto: PokemonDetailDto
    var description: String?
    var color: UIColor?
    
    init(pokemonDetailDto: PokemonDetailDto, description: String? = nil, color: UIColor? = nil) {
        self.pokemonDetailDto = pokemonDetailDto
        self.description = description?.replacingOccurrences(of: "\n", with: " ").replacingOccurrences(of: "\t", with: " ").replacingOccurrences(of: "POKéMON", with: "Pokémon") ?? ""
        self.color = color
    }
}

