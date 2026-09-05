import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = RestaurantListViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                Text("Restaurant Discovery")
                    .font(.headline)
                
                List(viewModel.restaurants) { restaurant in
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
