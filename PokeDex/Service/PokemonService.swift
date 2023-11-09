//
//  NetworkService.swift
//  PokemonAPI
//
//  Created by Ali Çolak on 3.11.2023.
//

import Foundation

enum ServiceError : Error {
    case serverError
    case decodingError
    case urlError
}

protocol PokemonService {
    func fetchAllPokemon(completion: @escaping (Result<PokemonListResponse, ServiceError>) -> ())
    func fetchPokemonByPage(pageNumber: Int, completion: @escaping (Result<PokemonListResponse, ServiceError>) -> ())
    func fetchPokemonDetail(pokemonId: Int, completion: @escaping (Result<PokemonDetail, ServiceError>) -> ())
    func fetchPokemonSpecies(speciesId: Int, completion: @escaping (Result<PokemonSpecies, ServiceError>) -> ())
}
