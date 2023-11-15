//
//  PokeDexTests.swift
//  PokeDexTests
//
//  Created by Kadirhan Keles on 4.11.2023.
//

import XCTest
@testable import PokeDex

final class PokeDexHomeTests: XCTestCase {

    private var mockPokemonService : MockPokemonManager!
    private var mockHomeViewModel : HomeViewModel!
    private var mockHomeViewOutput : MockHomeViewOutput!
    
    
    override func setUpWithError() throws {
        mockPokemonService = MockPokemonManager()
        
        mockHomeViewModel = HomeViewModel(pokemonService: mockPokemonService)
        
        mockHomeViewOutput = MockHomeViewOutput()
        mockHomeViewModel.delegate = mockHomeViewOutput
                
    }
    
    override func tearDownWithError() throws {
        mockHomeViewModel = nil
        mockPokemonService = nil
        mockHomeViewOutput = nil
    }

    func testInitalData_whenAPISuccess_pokemonCount() throws {
        mockHomeViewModel.changeSortMethodId()
        XCTAssertEqual(mockHomeViewOutput.pokemons.count, AppConstants.pageSize)
    }
    
    func testInitalData_whenAPISuccess_showFirstPokemon() throws {
        mockHomeViewModel.changeSortMethodId()
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].name, HomeTestData.idSortedAllPokemonsDto[0].name)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].id, HomeTestData.idSortedAllPokemonsDto[0].id)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].idString, HomeTestData.idSortedAllPokemonsDto[0].idString)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].imageUrl, HomeTestData.idSortedAllPokemonsDto[0].imageUrl)
    }
    
    func testInitalData_whenAPISuccess_showLastPokemon() throws {
        mockHomeViewModel.changeSortMethodId()
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].name, HomeTestData.idSortedAllPokemonsDto[AppConstants.pageSize - 1].name)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].id, HomeTestData.idSortedAllPokemonsDto[AppConstants.pageSize - 1].id)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].idString, HomeTestData.idSortedAllPokemonsDto[AppConstants.pageSize - 1].idString)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].imageUrl, HomeTestData.idSortedAllPokemonsDto[AppConstants.pageSize - 1].imageUrl)
    }
    
    func testInitalData_whenAPIFailure_pokemonCount() throws {
        
        mockPokemonService.fetchPokemonByPageMockResult = .failure(.serverError)
        mockHomeViewModel = HomeViewModel(pokemonService: mockPokemonService)
        mockHomeViewOutput = MockHomeViewOutput()
        mockHomeViewModel.delegate = mockHomeViewOutput
        
        XCTAssertEqual(mockHomeViewOutput.pokemons.count, 0)

    }
    
    func testChangeNameSortMethod_whenAPISuccess_pokemonCount() throws {
        mockHomeViewModel.changeSortMethodName()
        XCTAssertEqual(mockHomeViewOutput.pokemons.count, AppConstants.pageSize)
    }
    
    func testChangeNameSortMethod_whenAPISuccess_showFirstPokemon() throws {
        mockHomeViewModel.changeSortMethodName()
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].name, HomeTestData.nameSortedAllPokemonsDto[0].name)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].id, HomeTestData.nameSortedAllPokemonsDto[0].id)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].idString, HomeTestData.nameSortedAllPokemonsDto[0].idString)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].imageUrl, HomeTestData.nameSortedAllPokemonsDto[0].imageUrl)
    }
    
    func testChangeNameSortMethod_whenAPISuccess_showLastPokemon() throws {
        mockHomeViewModel.changeSortMethodName()
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].name, HomeTestData.nameSortedAllPokemonsDto[AppConstants.pageSize - 1].name)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].id, HomeTestData.nameSortedAllPokemonsDto[AppConstants.pageSize - 1].id)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].idString, HomeTestData.nameSortedAllPokemonsDto[AppConstants.pageSize - 1].idString)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].imageUrl, HomeTestData.nameSortedAllPokemonsDto[AppConstants.pageSize - 1].imageUrl)
    }
    
    func testChangeNameAndNumberSortMethod_whenAPISuccess_pokemonCount() throws {
        mockHomeViewModel.changeSortMethodName()
        mockHomeViewModel.changeSortMethodId()
        XCTAssertEqual(mockHomeViewOutput.pokemons.count, AppConstants.pageSize)
    }
    
    func testChangeNameAndNumberSortMethod_whenAPISuccess_showFirstPokemon() throws {
        mockHomeViewModel.changeSortMethodName()
        mockHomeViewModel.changeSortMethodId()
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].name, HomeTestData.idSortedAllPokemonsDto[0].name)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].id, HomeTestData.idSortedAllPokemonsDto[0].id)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].idString, HomeTestData.idSortedAllPokemonsDto[0].idString)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].imageUrl, HomeTestData.idSortedAllPokemonsDto[0].imageUrl)
    }
    
    func testChangeNameAndNumberSortMethod_whenAPISuccess_showLastPokemon() throws {
        mockHomeViewModel.changeSortMethodName()
        mockHomeViewModel.changeSortMethodId()
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].name, HomeTestData.idSortedAllPokemonsDto[AppConstants.pageSize - 1].name)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].id, HomeTestData.idSortedAllPokemonsDto[AppConstants.pageSize - 1].id)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].idString, HomeTestData.idSortedAllPokemonsDto[AppConstants.pageSize - 1].idString)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].imageUrl, HomeTestData.idSortedAllPokemonsDto[AppConstants.pageSize - 1].imageUrl)
    }
    
    func testPaginationNumberSorted_whenAPISuccess_pokemonCount() throws {
        mockHomeViewModel.getNewPokemons()
        XCTAssertEqual(mockHomeViewOutput.pokemons.count, AppConstants.pageSize * 2)
    }
    
    func testPaginationNumberSorted_whenAPISuccess_showFirstPokemon() throws {
        mockHomeViewModel.getNewPokemons()
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].name, HomeTestData.idSortedAllPokemonsDto[0].name)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].id, HomeTestData.idSortedAllPokemonsDto[0].id)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].idString, HomeTestData.idSortedAllPokemonsDto[0].idString)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].imageUrl, HomeTestData.idSortedAllPokemonsDto[0].imageUrl)
    }
    
    func testPaginationNumberSorted_whenAPISuccess_showLastPokemon() throws {
        mockHomeViewModel.getNewPokemons()
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].name, HomeTestData.idSortedAllPokemonsDto[AppConstants.pageSize * 2 - 1].name)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].id, HomeTestData.idSortedAllPokemonsDto[AppConstants.pageSize * 2 - 1].id)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].idString, HomeTestData.idSortedAllPokemonsDto[AppConstants.pageSize * 2 - 1].idString)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].imageUrl, HomeTestData.idSortedAllPokemonsDto[AppConstants.pageSize * 2 - 1].imageUrl)
    }
    
    
    func testPaginationNameSorted_whenAPISuccess_pokemonCount() throws {
        mockHomeViewModel.getNewPokemons()
        XCTAssertEqual(mockHomeViewOutput.pokemons.count, AppConstants.pageSize * 2)
    }
    
    func testPaginationNameSorted_whenAPISuccess_showFirstPokemon() throws {
        mockHomeViewModel.changeSortMethodName()
        mockHomeViewModel.getNewPokemons()
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].name, HomeTestData.nameSortedAllPokemonsDto[0].name)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].id, HomeTestData.nameSortedAllPokemonsDto[0].id)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].idString, HomeTestData.nameSortedAllPokemonsDto[0].idString)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].imageUrl, HomeTestData.nameSortedAllPokemonsDto[0].imageUrl)
    }
    
    func testPaginationNameSorted_whenAPISuccess_showLastPokemon() throws {
        mockHomeViewModel.changeSortMethodName()
        mockHomeViewModel.getNewPokemons()
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].name, HomeTestData.nameSortedAllPokemonsDto[AppConstants.pageSize * 2 - 1].name)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].id, HomeTestData.nameSortedAllPokemonsDto[AppConstants.pageSize * 2 - 1].id)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].idString, HomeTestData.nameSortedAllPokemonsDto[AppConstants.pageSize * 2 - 1].idString)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].imageUrl, HomeTestData.nameSortedAllPokemonsDto[AppConstants.pageSize * 2 - 1].imageUrl)
    }
    
    
    func testTurnNumberSortedFinishedPagination_whenAPISuccess_pokemonCount() throws {
        mockHomeViewModel.getNewPokemons()
        mockHomeViewModel.changeSortMethodName()
        mockHomeViewModel.changeSortMethodId()
        XCTAssertEqual(mockHomeViewOutput.pokemons.count, AppConstants.pageSize * 2)
    }
    
    func testTurnNumberSortedFinishedPagination_whenAPISuccess_showFirstPokemon() throws {
        mockHomeViewModel.getNewPokemons()
        mockHomeViewModel.changeSortMethodName()
        mockHomeViewModel.changeSortMethodId()
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].name, HomeTestData.idSortedAllPokemonsDto[0].name)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].id, HomeTestData.idSortedAllPokemonsDto[0].id)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].idString, HomeTestData.idSortedAllPokemonsDto[0].idString)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].imageUrl, HomeTestData.idSortedAllPokemonsDto[0].imageUrl)
    }
    
    func testTurnNumberSortedFinishedPagination_whenAPISuccess_showLastPokemon() throws {
        mockHomeViewModel.getNewPokemons()
        mockHomeViewModel.changeSortMethodName()
        mockHomeViewModel.changeSortMethodId()
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].name, HomeTestData.idSortedAllPokemonsDto[AppConstants.pageSize * 2 - 1].name)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].id, HomeTestData.idSortedAllPokemonsDto[AppConstants.pageSize * 2 - 1].id)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].idString, HomeTestData.idSortedAllPokemonsDto[AppConstants.pageSize * 2 - 1].idString)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].imageUrl, HomeTestData.idSortedAllPokemonsDto[AppConstants.pageSize * 2 - 1].imageUrl)
    }
    
    func testTurnNameSortedFinishedPagination_whenAPISuccess_pokemonCount() throws {
        mockHomeViewModel.changeSortMethodName()
        mockHomeViewModel.getNewPokemons()
        mockHomeViewModel.changeSortMethodId()
        mockHomeViewModel.changeSortMethodName()
        XCTAssertEqual(mockHomeViewOutput.pokemons.count, AppConstants.pageSize * 2)
    }
    
    func testTurnNameSortedFinishedPagination_whenAPISuccess_showFirstPokemon() throws {
        mockHomeViewModel.changeSortMethodName()
        mockHomeViewModel.getNewPokemons()
        mockHomeViewModel.changeSortMethodId()
        mockHomeViewModel.changeSortMethodName()
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].name, HomeTestData.nameSortedAllPokemonsDto[0].name)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].id, HomeTestData.nameSortedAllPokemonsDto[0].id)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].idString, HomeTestData.nameSortedAllPokemonsDto[0].idString)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].imageUrl, HomeTestData.nameSortedAllPokemonsDto[0].imageUrl)
    }
    
    func testTurnNameSortedFinishedPagination_whenAPISuccess_showLastPokemon() throws {
        mockHomeViewModel.changeSortMethodName()
        mockHomeViewModel.getNewPokemons()
        mockHomeViewModel.changeSortMethodId()
        mockHomeViewModel.changeSortMethodName()
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].name, HomeTestData.nameSortedAllPokemonsDto[AppConstants.pageSize * 2 - 1].name)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].id, HomeTestData.nameSortedAllPokemonsDto[AppConstants.pageSize * 2 - 1].id)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].idString, HomeTestData.nameSortedAllPokemonsDto[AppConstants.pageSize * 2 - 1].idString)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].imageUrl, HomeTestData.nameSortedAllPokemonsDto[AppConstants.pageSize * 2 - 1].imageUrl)
    }
    
    func testSearcByNamehSortNumber_whenAPISuccess_itemCount() throws {
        mockHomeViewModel.searchPokemon(text: HomeTestData.searchNameText)
        XCTAssertEqual(mockHomeViewOutput.pokemons.count, HomeTestData.searchPokemon(text: HomeTestData.searchNameText, sortType: .number).count)
    }
    
    func testSearchByNameSortNumber_whenAPISuccess_showFirstPokemon() throws {
        mockHomeViewModel.searchPokemon(text: HomeTestData.searchNameText)
        let searchPokemons = HomeTestData.searchPokemon(text: HomeTestData.searchNameText, sortType: .number)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].name, searchPokemons[0].name)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].id, searchPokemons[0].id)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].idString, searchPokemons[0].idString)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].imageUrl, searchPokemons[0].imageUrl)
    }
    
    func testSearchByNameSortNumber_whenAPISuccess_showLastPokemon() throws {
        mockHomeViewModel.searchPokemon(text: HomeTestData.searchNameText)
        let searchPokemons = HomeTestData.searchPokemon(text: HomeTestData.searchNameText, sortType: .number)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].name, searchPokemons[searchPokemons.count - 1].name)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].id, searchPokemons[searchPokemons.count - 1].id)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].idString, searchPokemons[searchPokemons.count - 1].idString)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].imageUrl, searchPokemons[searchPokemons.count - 1].imageUrl)
    }
    
    func testSearchByNameSortName_whenAPISuccess_itemCount() throws {
        mockHomeViewModel.searchPokemon(text: HomeTestData.searchNameText)
        mockHomeViewModel.changeSortMethodName()
        XCTAssertEqual(mockHomeViewOutput.pokemons.count, HomeTestData.searchPokemon(text: HomeTestData.searchNameText, sortType: .name).count)
    }
    
    func testSearchByNameSortName_whenAPISuccess_showFirstPokemon() throws {
        mockHomeViewModel.searchPokemon(text: HomeTestData.searchNameText)
        mockHomeViewModel.changeSortMethodName()
        let searchPokemons = HomeTestData.searchPokemon(text: HomeTestData.searchNameText, sortType: .name)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].name, searchPokemons[0].name)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].id, searchPokemons[0].id)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].idString, searchPokemons[0].idString)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].imageUrl, searchPokemons[0].imageUrl)
    }
    
    func testSearchByNameSortName_whenAPISuccess_showLastPokemon() throws {
        mockHomeViewModel.searchPokemon(text: HomeTestData.searchNameText)
        mockHomeViewModel.changeSortMethodName()
        let searchPokemons = HomeTestData.searchPokemon(text: HomeTestData.searchNameText, sortType: .name)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].name, searchPokemons[searchPokemons.count - 1].name)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].id, searchPokemons[searchPokemons.count - 1].id)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].idString, searchPokemons[searchPokemons.count - 1].idString)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].imageUrl, searchPokemons[searchPokemons.count - 1].imageUrl)
    }
    
    func testSearcByNumberSortNumber_whenAPISuccess_itemCount() throws {
        mockHomeViewModel.searchPokemon(text: HomeTestData.searchNumberText)
        XCTAssertEqual(mockHomeViewOutput.pokemons.count, HomeTestData.searchPokemon(text: HomeTestData.searchNumberText, sortType: .number).count)
    }
    
    func testSearchByNumberSortNumber_whenAPISuccess_showFirstPokemon() throws {
        mockHomeViewModel.searchPokemon(text: HomeTestData.searchNumberText)
        let searchPokemons = HomeTestData.searchPokemon(text: HomeTestData.searchNumberText, sortType: .number)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].name, searchPokemons[0].name)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].id, searchPokemons[0].id)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].idString, searchPokemons[0].idString)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].imageUrl, searchPokemons[0].imageUrl)
    }
    
    func testSearchByNumberSortNumber_whenAPISuccess_showLastPokemon() throws {
        mockHomeViewModel.searchPokemon(text: HomeTestData.searchNumberText)
        let searchPokemons = HomeTestData.searchPokemon(text: HomeTestData.searchNumberText, sortType: .number)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].name, searchPokemons[searchPokemons.count - 1].name)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].id, searchPokemons[searchPokemons.count - 1].id)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].idString, searchPokemons[searchPokemons.count - 1].idString)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].imageUrl, searchPokemons[searchPokemons.count - 1].imageUrl)
    }
    
    func testSearchByNumberSortName_whenAPISuccess_itemCount() throws {
        mockHomeViewModel.searchPokemon(text: HomeTestData.searchNumberText)
        mockHomeViewModel.changeSortMethodName()
        XCTAssertEqual(mockHomeViewOutput.pokemons.count, HomeTestData.searchPokemon(text: HomeTestData.searchNumberText, sortType: .name).count)
    }
    
    func testSearchByNumberSortName_whenAPISuccess_showFirstPokemon() throws {
        mockHomeViewModel.searchPokemon(text: HomeTestData.searchNumberText)
        mockHomeViewModel.changeSortMethodName()
        let searchPokemons = HomeTestData.searchPokemon(text: HomeTestData.searchNumberText, sortType: .name)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].name, searchPokemons[0].name)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].id, searchPokemons[0].id)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].idString, searchPokemons[0].idString)
        XCTAssertEqual(mockHomeViewOutput.pokemons[0].imageUrl, searchPokemons[0].imageUrl)
    }
    
    func testSearchByNumberSortName_whenAPISuccess_showLastPokemon() throws {
        mockHomeViewModel.searchPokemon(text: HomeTestData.searchNumberText)
        mockHomeViewModel.changeSortMethodName()
        let searchPokemons = HomeTestData.searchPokemon(text: HomeTestData.searchNumberText, sortType: .name)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].name, searchPokemons[searchPokemons.count - 1].name)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].id, searchPokemons[searchPokemons.count - 1].id)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].idString, searchPokemons[searchPokemons.count - 1].idString)
        XCTAssertEqual(mockHomeViewOutput.pokemons[mockHomeViewOutput.pokemons.count - 1].imageUrl, searchPokemons[searchPokemons.count - 1].imageUrl)
    }

}
