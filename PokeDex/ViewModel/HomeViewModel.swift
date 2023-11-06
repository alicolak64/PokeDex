//
//  PokemonViewModel.swift
//  PokemonAPI
//
//  Created by Ali Çolak on 3.11.2023.
//

import Foundation


class HomeViewModel {
    private var searchText: String?
    private let pokemonService : PokemonService
    
    weak var delegate : HomeViewModelDelegate?
    
    private var allPokemons: [PokemonDto] = []
    
    private var representedPokemons: [PokemonDto] = []
    
    private var idSortedPokemons: [PokemonDto] = []
    private var nameSortedPokemons: [PokemonDto] = []
    
    private var idPageNumber = 1
    
    private var isSorteedId = true
    
    init(pokemonService: PokemonService) {
        self.pokemonService = pokemonService
        fetchInitalData()
    }
    
    
    func changeSortMethodId() {
        
        if !isSorteedId {
            representedPokemons = idSortedPokemons
            isSorteedId = true
        }
        
        representPokemons()
        
    }
    
    func changeSortMethodName() {
        
        if isSorteedId {
            representedPokemons = nameSortedPokemons
            isSorteedId = false
        }
        
        representPokemons()
        
    }
    
    func getNewPokemons() {
        if let searchText {
            return
        }
        if isSorteedId {
            fetchNewPokemonIdSorted()
        } else {
            fetchNewPokemonNameSorted()
        }
        
    }
    
    func searchPokemon(text: String) {
        searchText = text
        if text.count != 0 {
            
            if (text.first == "#") {
                
                representedPokemons = allPokemons.filter { pokemon in
                    
                    let searchedLowerText = text.lowercased()
                    
                    return pokemon.idString.lowercased().contains(searchedLowerText)
                    
                }
                
            } else {
                representedPokemons = allPokemons.filter { pokemon in
                    
                    let searchedLowerText = text.lowercased()
                    
                    return pokemon.name.lowercased().contains(searchedLowerText)
                    
                }
            }
            
        } else {
            if isSorteedId {
                representedPokemons = idSortedPokemons
            } else {
                representedPokemons = nameSortedPokemons
            }
        }
        
        representPokemons()
        
    }
    
    private func fetchInitalData() {
        fetchAllPokemon()
        getNewPokemons()
    }
    
    private func representPokemons() {
        var sortedPokemons: [PokemonDto]
        
        if isSorteedId {
            sortedPokemons = representedPokemons.sorted { $0.id < $1.id }
        } else {
            sortedPokemons = representedPokemons.sorted { $0.name < $1.name }
        }
        
        var uniquePokemons: [PokemonDto] = []
        var seenIDs = Set<Int>()
        for pokemon in sortedPokemons {
            if !seenIDs.contains(pokemon.id) {
                uniquePokemons.append(pokemon)
                seenIDs.insert(pokemon.id)
            }
        }
        
        self.delegate?.updatePokemonList(pokemonList: uniquePokemons)
        
    }
    
    private func fetchAllPokemon() {
        
        pokemonService.fetchAllPokemon { result in
            
            switch result {
            case .success(let pokemonList):
                
                self.allPokemons = pokemonList.results.map(PokemonDto.init).sorted { $0.name < $1.name }
                
                self.fetchNewPokemonNameSorted()
                
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
    
    
    private func fetchNewPokemonIdSorted() {
        
        if idSortedPokemons.count < AppConstants.allPokemonCount {
                        
            pokemonService.fetchPokemonByPage(pageNumber: idPageNumber) { [self] result in
                
                switch result {
                case .success(let pokemonList):
                    
                    self.idPageNumber = self.idPageNumber + 1
                    
                    let newPagedPokemons = pokemonList.results.map(PokemonDto.init)
                    
                    self.idSortedPokemons.append(contentsOf: newPagedPokemons)
                    self.representedPokemons = self.idSortedPokemons
                    
                    self.representPokemons()
                    
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
        
    }
    
    private func fetchNewPokemonNameSorted() {
        
        if nameSortedPokemons.count < AppConstants.allPokemonCount {
            
            let startIndex = nameSortedPokemons.count
            let endIndex = min(startIndex + AppConstants.pageSize, allPokemons.count - 1)
            
            self.nameSortedPokemons.append(contentsOf: allPokemons[startIndex...endIndex])
            self.representedPokemons = self.nameSortedPokemons
            
            self.representPokemons()
            
        }
        
        
    }
    
}
