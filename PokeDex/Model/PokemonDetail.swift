//
//  Pokemon.swift
//  PokemonAPI
//
//  Created by Ali Çolak on 3.11.2023.
//

import Foundation

struct PokemonDetail: Codable {
    var abilities: [Abilities]?
    var base_experience: Int?
    var forms: [NameUrl]?
    var game_indices: [GameIndex]?
    var height: Int?
    var held_items: [HeldItem]?
    var id: Int
    var is_default: Bool?
    var location_area_encounters: String?
    var moves: [Moves]?
    var name: String?
    var order: Int?
    var species: NameUrl?
    var stats: [Stat]?
    var types: [PokemonType]?
    var weight: Int?
}

struct Abilities: Codable {
    var ability: NameUrl
    var is_hidden: Bool
    var slot: Int
}

struct GameIndex: Codable {
    var game_index: Int
    var version: NameUrl
}

struct VersionDetail: Codable {
    var rarity: Int
    var version: NameUrl
}

struct HeldItem: Codable {
    var item: NameUrl
    var version_details: [VersionDetail]
}

struct VersionGroupDetail: Codable {
    var level_lernead_at: Int?
    var move_learn_method: NameUrl
    var version_group: NameUrl
}

struct Moves: Codable {
    var move: NameUrl
    var version_group_details: [VersionGroupDetail]
}

struct NameUrl: Codable {
    var name: String
    var url: String
}

struct Stat: Codable {
    var base_stat: Int
    var effort: Int
    var stat: NameUrl
}

struct PokemonType: Codable {
    var slot: Int
    var type: NameUrl
}




