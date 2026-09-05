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
                                
                Button {
                    viewModel.toggleFavorite(for: restaurant)
                } label: {
                    Image(systemName: viewModel.isFavorite(restaurant)
                          ? "checkmark"
                          : "xmark")
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
