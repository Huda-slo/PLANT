//
//  page1.swift
//  plant
//
//  Created by Huda Almadi on 24/04/1446 AH.
//

import SwiftUI

// Define a simple Plant model
struct Plant: Identifiable {
    var id = UUID()
    var name: String
    var room: String
    var light: String
    var wateringDays: String
    var waterAmount: String
}

struct Page1: View {
    // Sample data - replace this with actual data storage/retrieval logic
    @State private var plants: [Plant] = [
        Plant(name: "Monstera", room: "Living Room", light: "Full Sun", wateringDays: "Every 3 days", waterAmount: "250 ml"),
        Plant(name: "Pothos", room: "Bedroom", light: "Partial Sun", wateringDays: "Weekly", waterAmount: "500 ml")
    ]
    
    var body: some View {
        NavigationView {
            List(plants) { plant in
                VStack(alignment: .leading) {
                    Text(plant.name)
                        .font(.headline)
                        .foregroundColor(.white)
                    Text("Room: \(plant.room)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("Light: \(plant.light)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("Watering Days: \(plant.wateringDays)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("Water Amount: \(plant.waterAmount)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
            .navigationTitle("My Plants")
        }
    }
}

#Preview {
    Page1()
}
