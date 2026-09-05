import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = RestaurantListViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.restaurants) { restaurant in
                NavigationLink {
                    RestaurantDetailView(restaurant: restaurant)
                } label: {
                    Text(restaurant.name)
                }
            }
            .padding()
            .navigationTitle("Restaurants")
        }
        .task {
            await viewModel.load()
        }
    }
}

#Preview {
    ContentView()
}
