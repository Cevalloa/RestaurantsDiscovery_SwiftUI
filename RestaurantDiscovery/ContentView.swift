import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = RestaurantListViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                Text("Restaurant Discovery")
                    .font(.headline)

                Text("Browse restaurants from local sample data.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
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
