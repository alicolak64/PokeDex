//
//  SpeciesDto.swift
//  PokemonAPI
//
//  Created by Ali Çolak on 3.11.2023.
//

import UIKit

struct PokemonDetailExtensionDto {
    
    var pokemonDetailDto: PokemonDetailDto
    var descripiton : String?
    var color : UIColor?
    
    init(pokemonDetailDto: PokemonDetailDto, descripiton: String? = nil, color: UIColor? = nil) {
        self.pokemonDetailDto = pokemonDetailDto
        self.descripiton = descripiton
        self.color = color
    }
    
}

