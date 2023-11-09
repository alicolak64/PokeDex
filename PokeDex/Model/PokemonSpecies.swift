//
//  PokemonSpecies.swift
//  PokemonAPI
//
//  Created by Ali Çolak on 3.11.2023.
//

import Foundation

struct PokemonSpecies: Codable {
    let flavor_text_entries: [FlavorTextEntry]
    let color: NameUrl
}

struct FlavorTextEntry: Codable {
    let flavor_text: String
    let language: Language
    let version: Version
}

struct Language : Codable{
    let name: String
    let url: String
}

struct Version: Codable {
    let name: String
    let url: String
}
