//
//  MockPokemonManager.swift
//  PokeDexTests
//
//  Created by Ali Çolak on 14.11.2023.
//

import XCTest
@testable import PokeDex

class MockPokemonManager : PokemonService {
    
    private var pokemons : [PokemonResponseResult]!
    var fetchAllPokemonMockResult : Result<PokeDex.PokemonListResponse, PokeDex.ServiceError>?
    var fetchPokemonByPageMockResult : Result<PokeDex.PokemonListResponse, PokeDex.ServiceError>?
    
    
    func fetchAllPokemon(completion: @escaping (Result<PokeDex.PokemonListResponse, PokeDex.ServiceError>) -> ()) {
        
        if let fetchAllPokemonMockResult {
            completion(fetchAllPokemonMockResult)
        }
        
        let pokemonList = try? JSONDecoder().decode(PokemonListResponse.self, from: HomeTestData.allPokemonJSON)
        
        if let pokemonList = pokemonList {
            completion(.success(pokemonList))
            self.pokemons = pokemonList.results
        } else {
            completion(.failure(.decodingError))
        }
    }
    
    func fetchPokemonByPage(pageNumber: Int, completion: @escaping (Result<PokeDex.PokemonListResponse, PokeDex.ServiceError>) -> ()) {
        
        if let fetchPokemonByPageMockResult {
            completion(fetchPokemonByPageMockResult)
        }
        
        
        let startIndex = (pageNumber - 1) * AppConstants.pageSize
        let endIndex = min(startIndex + AppConstants.pageSize - 1, pokemons.count - 1)

        let data = pokemons[startIndex...endIndex]
        
        if !data.isEmpty {
            let pokemonList = data[startIndex...endIndex]
            
            let response = PokemonListResponse(count: AppConstants.pageSize, results: Array(pokemonList))

            completion(.success(response))

        } else {
            completion(.failure(.serverError))
        }
        
        
    }
    
    func fetchPokemonDetail(pokemonId: Int, completion: @escaping (Result<PokeDex.PokemonDetail, PokeDex.ServiceError>) -> ()) {
        
        if let jsonData = DetailTestData.pokemonDetailJSON.data(using: .utf8) {
            do {
                let pokemonDetail = try JSONDecoder().decode(PokeDex.PokemonDetail.self, from: jsonData)
                completion(.success(pokemonDetail))
            } catch {
                completion(.failure(.decodingError))
            }
        } else {
            completion(.failure(.decodingError))
        }
        
    }
    
    func fetchPokemonSpecies(speciesId: Int, completion: @escaping (Result<PokeDex.PokemonSpecies, PokeDex.ServiceError>) -> ()) {
        
        if let jsonData = DetailTestData.pokemonSpeciesJSON.data(using: .utf8) {
            do {
                let pokemonSpecies = try JSONDecoder().decode(PokeDex.PokemonSpecies.self, from: jsonData)
                completion(.success(pokemonSpecies))
            } catch {
                completion(.failure(.decodingError))
            }
        } else {
            completion(.failure(.decodingError))
        }
        
    }
    
    
}
