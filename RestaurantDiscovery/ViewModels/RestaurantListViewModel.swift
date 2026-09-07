import Foundation

@MainActor
final class RestaurantListViewModel: ObservableObject {
    @Published var restaurants: [Restaurant] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var favoriteRestaurantIDs: Set<Int> = []
    @Published var searchableText = ""

    private let service: RestaurantService

    init(service: RestaurantService = RestaurantService()) {
        self.service = service
    }

    func load() async {
        // TODO:
        // 1. Set loading state
        // 2. Clear any old error
        // 3. Load restaurants from the service
        // 4. Sort highest rating first
        // 5. Handle failure
        do {
            // Question: Could I use await here or async? Would async be better here
            isLoading = true
            restaurants = try await service.loadRestaurants().sorted(by: { restaurant1, restaurant2 in
                restaurant1.rating > restaurant2.rating
            })
            
            isLoading = false
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }

    func toggleFavorite(for restaurant: Restaurant) {
        // TODO: Toggle the restaurant id in favoriteRestaurantIDs.
        // Question, should we add a new property for favorites on Restaurant ?
        if favoriteRestaurantIDs.contains(restaurant.id) {
            favoriteRestaurantIDs.remove(restaurant.id)
        } else {
            favoriteRestaurantIDs.insert(restaurant.id)
        }
    }

    func isFavorite(_ restaurant: Restaurant) -> Bool {
        // TODO: Return whether this restaurant is a favorite.
        return favoriteRestaurantIDs.contains(restaurant.id)
    }
    
    var searchableRestaurants: [Restaurant] {
        guard !searchableText.isEmpty else {
            return restaurants
        }
        
        return restaurants.filter { restaurant in
            restaurant.name.localizedStandardContains(searchableText)
        }
    }
}
