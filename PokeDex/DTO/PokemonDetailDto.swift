//
//  PokemonDetailDto.swift
//  PokemonAPI
//
//  Created by Ali Çolak on 3.11.2023.
//

import Foundation


struct PokemonDetailDto: Codable {
    
    let pokemonDetail : PokemonDetail
        
    var abilities: [String]? {
        if let abilities = pokemonDetail.abilities {
            let transformedAbilities = abilities.map { abilityDto in
                let capitalizedAbilityName = abilityDto.ability.name.prefix(1).capitalized + abilityDto.ability.name.dropFirst()
                return String(capitalizedAbilityName)
            }
            return transformedAbilities
        } else {
            return nil
        }
    }
    
    var height : Double? {
        Double((pokemonDetail.height ?? 0))/10
    }
    
    var idString: String {
        let formattedID = String(format: "%03d", pokemonDetail.id)
        return "#" + formattedID
    }
    
    var name : String? {
        guard let firstCharacter = pokemonDetail.name?.first else {
            return "No Name"
        }
        return String(firstCharacter).uppercased() + (pokemonDetail.name?.dropFirst().lowercased() ?? "No Name")
    }
    
    var stats: [StatDto]? {
        
        pokemonDetail.stats?.map {
            let name = $0.stat.name
            let transformedName: String
            
            switch name {
            case "hp":
                transformedName = "HP"
            case "attack":
                transformedName = "ATK"
            case "defense":
                transformedName = "DEF"
            case "special-attack":
                transformedName = "SATK"
            case "special-defense":
                transformedName = "SDEF"
            case "speed":
                transformedName = "SPD"
            default:
                transformedName = name.uppercased()
            }
            
            return StatDto(base_stat: $0.base_stat, stat: transformedName)
        }
        
        
    }
    
    var types: [String]? {
        if let types = pokemonDetail.types {
            let transformedTypes = types.enumerated().map { (index, typeDto) in
                let capitalizedTypeName = typeDto.type.name.prefix(1).capitalized + typeDto.type.name.dropFirst()
                return String(capitalizedTypeName)
            }
            return transformedTypes
        } else {
            return nil
        }
    }
    
    var weight : Double? {
        Double((pokemonDetail.weight ?? 0))/10
    }
    
    var imageUrl: String {
        if pokemonDetail.id <= AppConstants.limitOWnImageId {
            return AppConstants.baseImageUrl + String(pokemonDetail.id)  + ".png"
        } else {
            return AppConstants.noImageUrl
        }
    }
    
}

struct StatDto: Codable {
    var base_stat: Int
    var stat: String
}

