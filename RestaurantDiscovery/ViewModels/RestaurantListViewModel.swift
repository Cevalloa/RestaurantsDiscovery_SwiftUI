import Foundation

@MainActor
final class RestaurantListViewModel: ObservableObject {
    @Published var restaurants: [Restaurant] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var favoriteRestaurantIDs: Set<Int> = []

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
    }

    func toggleFavorite(for restaurant: Restaurant) {
        // TODO: Toggle the restaurant id in favoriteRestaurantIDs.
    }

    func isFavorite(_ restaurant: Restaurant) -> Bool {
        // TODO: Return whether this restaurant is a favorite.
        false
    }
}
