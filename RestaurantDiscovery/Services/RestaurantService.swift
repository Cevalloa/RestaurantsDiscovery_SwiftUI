import Foundation

struct RestaurantService {
    enum RestaurantServiceError: Error {
        case fileNotFound
    }

    func loadRestaurants() async throws -> [Restaurant] {
        // The file lookup is already provided. Finish the decoding logic.
        guard let url = Bundle.main.url(forResource: "restaurants", withExtension: "json") else {
            throw RestaurantServiceError.fileNotFound
        }

        let data = try Data(contentsOf: url)

        return try JSONDecoder().decode([Restaurant].self, from: data)
    }
}
