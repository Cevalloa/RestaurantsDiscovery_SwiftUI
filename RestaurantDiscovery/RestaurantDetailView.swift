//
//  RestaurantDetailView.swift
//  RestaurantDiscovery
//
//  Created by Alex Cevallos on 9/5/26.
//

import SwiftUI

struct RestaurantDetailView: View {
    
    var restaurant: Restaurant
    var body: some View {
        
        VStack {
            Text(restaurant.name)
        }
    }
}
