//
//  RestaurantDiscoveryTests.swift
//  RestaurantDiscoveryTests
//
//  Created by Alex Cevallos on 9/6/26.
//

import Testing
@testable import RestaurantDiscovery

struct RestaurantDiscoveryTests {

    @Test
    @MainActor
    func filteredRestuarants_defaultReturnsFull() async throws {
        let viewModel = RestaurantListViewModel()
        await viewModel.load()
        let searchableRestaurants = viewModel.searchableRestaurants
        
        #expect(!searchableRestaurants.isEmpty)
    }
    
    @Test
    @MainActor
    func filteredRestaurants_defaultReturnsCount() async throws {
        let viewModel = RestaurantListViewModel()
        await viewModel.load()
        let searchableRestaurants = viewModel.searchableRestaurants
        
        #expect(searchableRestaurants.count == 6)
    }
}
