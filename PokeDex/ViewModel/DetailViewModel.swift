//
//  DetailsScreenViewModel.swift
//  PokemonAPI
//
//  Created by Ali Çolak on 3.11.2023.
//

import UIKit

class DetailViewModel {
    
    private let pokemonService : PokemonService
    
    weak var delegate : DetailViewModelDelegate?
    
    init(pokemonService: PokemonService) {
        self.pokemonService = pokemonService
    }
    
    func getPokemon(pokemonId: Int) {
        fetchPokemonDetail(pokemonId: pokemonId)
    }
    
    private func fetchPokemonDetail(pokemonId: Int) {
        
        pokemonService.fetchPokemonDetail(pokemonId: pokemonId) { result in
            
            switch result {
            case .success(let pokemon):
                
                let pokemonDto = PokemonDetailDto.init(pokemonDetail: pokemon)
                let color = self.getColorFromString(color: (pokemon.types?.first?.type.name) ?? "normal")
                
                if pokemon.id <= AppConstants.limitOwnSpeciesId  {
                    self.pokemonService.fetchPokemonSpecies(speciesId: pokemonId, completion: { result in
                        
                        switch result {
                        case .success(let species):
                            
                            let description = self.getRandomFlavorText(flavorTexts: species.flavor_text_entries)
                            
                            self.delegate?.updatePokemon(pokemon: PokemonDetailExtensionDto(pokemonDetailDto: pokemonDto,
                                                                                            description: description, color: color))
                            
                        case .failure(_):
                            
                            let color = UIColor.black
                            let descripiton = "Default Flavor Text"
                            
                            self.delegate?.updatePokemon(pokemon: PokemonDetailExtensionDto(pokemonDetailDto: pokemonDto,
                                                                                            description: descripiton, color: color))
                        }
                        
                    }
                                                            
                    )
                } else {
                    
                    let description = "Default Flavor Text"
                    
                    
                    self.delegate?.updatePokemon(pokemon: PokemonDetailExtensionDto(pokemonDetailDto: pokemonDto,
                                                                                    description: description, color: color))
                }
                
            case .failure(let error):
                switch error {
                case .urlError:
                    print("There is an error in the url")
                case .decodingError:
                    print("There is an Error in Model or JSON data")
                case .serverError:
                    print("There is a problem with the server")
                }
            }
            
        }
    }
    
    func getColorFromString(color: String) -> UIColor {
        let colorMap = [
            "normal": "#A8A77A",
            "fire": "#EE8130",
            "water": "#6390F0",
            "electric": "#F7D02C",
            "grass": "#7AC74C",
            "ice": "#96D9D6",
            "fighting": "#C22E28",
            "poison": "#A33EA1",
            "ground": "#E2BF65",
            "flying": "#A98FF3",
            "psychic": "#F95587",
            "bug": "#A6B91A",
            "rock": "#B6A136",
            "ghost": "#735797",
            "dragon": "#6F35FC",
            "dark": "#705746",
            "steel": "#B7B7CE",
            "fairy": "#D685AD",
            "unknown": "#4D5645",
            "shadow": "#573C14"
        ]
        
        return UIColor(hex: colorMap[color.lowercased()]!) ?? UIColor.black
        
    }
    
    private func getRandomFlavorText(flavorTexts :[FlavorTextEntry]) -> String {
        
        let englishFlavorTexts = flavorTexts.filter { $0.language.name == "en" }
        
        if englishFlavorTexts.isEmpty {
            return "Default Flavor Text"
        }
        
        if let randomFlavorText = englishFlavorTexts.randomElement() {
            return randomFlavorText.flavor_text
        }
        
        return "Default Flavor Text"
        
    }
    
    func getProgressValue(stat: Int) -> Float {
        let value = Float(stat) / 255
        return value
    }
    
}
