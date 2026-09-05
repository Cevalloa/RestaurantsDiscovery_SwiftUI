import Foundation

// TODO: Complete this model so it can decode restaurants.json and be used in SwiftUI lists/navigation.
class Restaurant: Decodable, Identifiable {
    // Add the required properties.
    var id: Int
    var name: String
    var cuisine: String
    var rating: Double
    var deliveryTimeMinutes: Int
    var deliveryFee: Double
    var description: String
}
