//
//  PokemonListResponse.swift
//  PokemonAPI
//
//  Created by Ali Çolak on 3.11.2023.
//

import Foundation


struct PokemonListResponse: Codable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [PokemonResponseResult]
}

struct PokemonResponseResult: Codable {
    var name: String
    var url: String
}


