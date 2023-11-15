//
//  PokeDexDetailTests.swift
//  PokeDexTests
//
//  Created by Ali Çolak on 15.11.2023.
//

import XCTest
@testable import PokeDex

final class PokeDexDetailTests: XCTestCase {
    
    private var mockPokemonService : MockPokemonManager!
    private var mockDetailViewModel : DetailViewModel!
    private var mockDetailViewOutput : MockDetailOutput!
    
    private var pokemon: PokemonDetailExtensionDto!
    private var flavorTexts : [String]!
    
    
    override func setUpWithError() throws {
        mockPokemonService = MockPokemonManager()
        
        mockDetailViewModel = DetailViewModel(pokemonService: mockPokemonService)
        
        mockDetailViewOutput = MockDetailOutput()
        mockDetailViewModel.delegate = mockDetailViewOutput
        
        mockDetailViewModel.getPokemon(pokemonId: DetailTestData.initalPokemonId)
        
        pokemon = DetailTestData.pokemonExtensionDto
        flavorTexts = DetailTestData.pokemonFlavorTexts
                
    }
    
    override func tearDownWithError() throws {
        mockDetailViewModel = nil
        mockPokemonService = nil
        mockDetailViewOutput = nil
        
    }
    
    func testPokemonDetails_whenAPISuccess_showDetail() throws {
        XCTAssertEqual(mockDetailViewOutput.pokemon?.pokemonDetailDto.name, pokemon.pokemonDetailDto.name)
        XCTAssertEqual(mockDetailViewOutput.pokemon?.pokemonDetailDto.idString, pokemon.pokemonDetailDto.idString)
        XCTAssertEqual(mockDetailViewOutput.pokemon?.pokemonDetailDto.imageUrl, pokemon.pokemonDetailDto.imageUrl)
        XCTAssertEqual(mockDetailViewOutput.pokemon?.pokemonDetailDto.height, pokemon.pokemonDetailDto.height)
        XCTAssertEqual(mockDetailViewOutput.pokemon?.pokemonDetailDto.weight, pokemon.pokemonDetailDto.weight)
        XCTAssertEqual(mockDetailViewOutput.pokemon?.pokemonDetailDto.abilities, pokemon.pokemonDetailDto.abilities)
        XCTAssertEqual(mockDetailViewOutput.pokemon?.pokemonDetailDto.types, pokemon.pokemonDetailDto.types)
        XCTAssertEqual(mockDetailViewOutput.pokemon?.color, pokemon.color)
    }
    
    func testPokemonDescription_whenAPISuccess_showDescription() throws {
        XCTAssertTrue(flavorTexts.contains((mockDetailViewOutput.pokemon?.description)!))
    }
    
    func testPokemonStats_whenAPISuccess_itemCount() throws {
        XCTAssertEqual(mockDetailViewOutput.pokemon?.pokemonDetailDto.stats?.count, pokemon.pokemonDetailDto.stats?.count)
    }
    
    func testPokemonStats_whenAPISuccess_showStats() throws {
        XCTAssertEqual(mockDetailViewOutput.pokemon?.pokemonDetailDto.stats?[0].base_stat, pokemon.pokemonDetailDto.stats?[0].base_stat)
        XCTAssertEqual(mockDetailViewOutput.pokemon?.pokemonDetailDto.stats?[0].stat, pokemon.pokemonDetailDto.stats?[0].stat)
        XCTAssertEqual(mockDetailViewOutput.pokemon?.pokemonDetailDto.stats?[1].base_stat, pokemon.pokemonDetailDto.stats?[1].base_stat)
        XCTAssertEqual(mockDetailViewOutput.pokemon?.pokemonDetailDto.stats?[1].stat, pokemon.pokemonDetailDto.stats?[1].stat)
        XCTAssertEqual(mockDetailViewOutput.pokemon?.pokemonDetailDto.stats?[2].base_stat, pokemon.pokemonDetailDto.stats?[2].base_stat)
        XCTAssertEqual(mockDetailViewOutput.pokemon?.pokemonDetailDto.stats?[2].stat, pokemon.pokemonDetailDto.stats?[2].stat)
        XCTAssertEqual(mockDetailViewOutput.pokemon?.pokemonDetailDto.stats?[3].base_stat, pokemon.pokemonDetailDto.stats?[3].base_stat)
        XCTAssertEqual(mockDetailViewOutput.pokemon?.pokemonDetailDto.stats?[3].stat, pokemon.pokemonDetailDto.stats?[3].stat)
        XCTAssertEqual(mockDetailViewOutput.pokemon?.pokemonDetailDto.stats?[4].base_stat, pokemon.pokemonDetailDto.stats?[4].base_stat)
        XCTAssertEqual(mockDetailViewOutput.pokemon?.pokemonDetailDto.stats?[4].stat, pokemon.pokemonDetailDto.stats?[4].stat)
        XCTAssertEqual(mockDetailViewOutput.pokemon?.pokemonDetailDto.stats?[5].base_stat, pokemon.pokemonDetailDto.stats?[5].base_stat)
        XCTAssertEqual(mockDetailViewOutput.pokemon?.pokemonDetailDto.stats?[5].stat, pokemon.pokemonDetailDto.stats?[5].stat)

    }
    
}
