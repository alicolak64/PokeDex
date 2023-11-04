//
//  NetworkService.swift
//  PokemonAPI
//
//  Created by Ali Çolak on 3.11.2023.
//

import Foundation

final class PokemonManager :  PokemonService {
    
    
    private struct Constants {
        static let baseURL = AppConstants.baseUrl
        static let allPokemonQuery = "?limit=" + String(AppConstants.allPokemonCount)
        static let paginationLimitQuery = "&limit=" + String(AppConstants.pageSize)
        static let offsetQuery = "?offset="
        static let pageSize = AppConstants.pageSize
    }
    
    
    enum endpoints: String {
        case pokemon = "pokemon/"
        case pokemonSpecies = "pokemon-species/"
    }
    
    func fetchAllPokemon(completion: @escaping (Result<PokemonListResponse,ServiceError>)-> ()) {
        

        
        if let url = URL(string: Constants.baseURL + endpoints.pokemon.rawValue +  Constants.allPokemonQuery) {
            
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if error != nil {
                    completion(.failure(.serverError))
                } else if let data = data {
                    
                    let pokemonList = try? JSONDecoder().decode(PokemonListResponse.self, from: data)
                                        
                    if let pokemonList = pokemonList {
                        completion(.success(pokemonList))
                    } else {
                        completion(.failure(.decodingError))
                    }
                }
            }.resume()
            
        } else {
            completion(.failure(.urlError))
            return
        }
    }
    
    func fetchPokemonByPage(pageNumber: Int, completion: @escaping (Result<PokemonListResponse, ServiceError>) -> ()) {
        if let url = URL(string: Constants.baseURL + endpoints.pokemon.rawValue + Constants.offsetQuery + String((pageNumber - 1) * AppConstants.pageSize) + Constants.paginationLimitQuery) {
            
                        
            URLSession.shared.dataTask(with: url) { data, response, error in
                if error != nil {
                    completion(.failure(.serverError))
                } else if let data = data {
                    
                    let pokemonList = try? JSONDecoder().decode(PokemonListResponse.self, from: data)
                                        
                    if let pokemonList = pokemonList {
                        completion(.success(pokemonList))
                    } else {
                        completion(.failure(.decodingError))
                    }
                }
            }.resume()
            
        } else {
            completion(.failure(.urlError))
            return
        }
    }
    
    func fetchPokemonDetail(pokemonId: Int, completion: @escaping (Result<PokemonDetail, ServiceError>) -> ()) {
        if let url = URL(string: Constants.baseURL + endpoints.pokemon.rawValue + String(pokemonId)) {
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if error != nil {
                    completion(.failure(.serverError))
                } else if let data = data {
                    
                    let pokemonDetail = try? JSONDecoder().decode(PokemonDetail.self, from: data)
                    
                    if let pokemonDetail = pokemonDetail {
                        completion(.success(pokemonDetail))
                    } else {
                        completion(.failure(.decodingError))
                    }
                }
            }.resume()
            
        } else {
            completion(.failure(.urlError))
            return
        }
    }
    
    func fetchPokemonSpecies(speciesId: Int, completion: @escaping (Result<PokemonSpecies, ServiceError>) -> ()) {
        if let url = URL(string: Constants.baseURL + endpoints.pokemonSpecies.rawValue + String(speciesId)) {
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if error != nil {
                    completion(.failure(.serverError))
                } else if let data = data {
                    
                    let pokemonSpecies = try? JSONDecoder().decode(PokemonSpecies.self, from: data)
                    
                    if let pokemonSpecies = pokemonSpecies {
                        completion(.success(pokemonSpecies))
                    } else {
                        completion(.failure(.decodingError))
                    }
                }
            }.resume()
            
        } else {
            completion(.failure(.urlError))
            return
        }
    }
    
    
}

