import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = RestaurantListViewModel()

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading == true {
                    ProgressView("Loading Restaurants")
                } else if let errorMessage = viewModel.errorMessage {
                    ContentUnavailableView(errorMessage, systemImage: "xmark")
                } else if !viewModel.restaurants.isEmpty {
                    List(viewModel.searchableRestaurants) { restaurant in
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
                    }.searchable(
                        text:$viewModel.searchableText,
                        prompt: "What do you want to search?")
                } else {
                    ContentUnavailableView("Restaurants unavailable", systemImage: "xmark")
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
