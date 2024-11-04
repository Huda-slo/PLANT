//
//  ContentView.swift
//  plant
//
//  Created by Huda Almadi on 20/04/1446 AH.
//

import SwiftUI

struct welcome: View {
    @State private var isShowingSheet = false
    @State private var playerName: String = ""


    var body: some View {
        VStack {
            HStack {
                Text("My Plants 🌱")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading, 16)
                Spacer()
            }
            .padding(.top, 40)
            
            Divider()
                .background(Color.white)
                .padding(.horizontal, 16)
            
            ZStack {
                Image("PlantBackground")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 300)
                    .clipped()
                
                Image("plant1")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .background(Color.black.opacity(0.1))
                    .padding()
            }
            
            Spacer()
            
            Text("Start your plant journey!")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top, 8)
            
            Text("Now all your plants will be in one place and we will help you take care of them :) 🪴")
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
                .padding(.top, 4)
            
            Spacer()
            
            Button(action: {
                isShowingSheet = true
            }) {
                Text("Set Plant Reminder")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green1)
                    .cornerRadius(12)
                    .padding(.horizontal, 24)
            }
            .sheet(isPresented: $isShowingSheet) {
                ReminderSheetView()
            }
            
            Spacer()
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .foregroundColor(.white)
    }
}

struct ReminderSheetView: View {
    @State private var plantName = "Pothos"
    @State private var selectedRoom = "Bedroom"
    @State private var selectedLight = "Full sun"
    @State private var selectedWateringDays = "Every day"
    @State private var selectedWaterAmount = "20-50 ml"
    
    let roomOptions = ["Bedroom", "Living Room", "Kitchen", "Balcony", "Bathroom"]
    let lightOptions = ["Full sun", "Partial Sun", "Low light"]
    let wateringDayOptions = ["Every day", "Every 2 days", "Every 3 days", "Once a week", "Every 10 days", "Every 2 weeks"]
    let waterAmountOptions = ["20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"]
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            HStack {
                // Cancel button with styling
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                        .fontWeight(.bold)
                        .padding()
                        .frame(minWidth: 100)
                        .foregroundColor(.green1)
                        .cornerRadius(8)
                }

                Spacer()

                Text("Set Reminder")
                    .font(.headline)
                    .foregroundColor(.white)

                Spacer()

                // Save button with styling
                Button(action: {
                    // Logic to save the reminder
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save")
                        .fontWeight(.bold)
                        .padding()
                        .frame(minWidth: 100)
                        .foregroundColor(.green1)
                        .cornerRadius(8)
                }
            }
            .padding()
            
            Divider()
                .background(Color.gray)
            
            VStack(spacing: 10) {
                formRow(title: "Plant Name") {
                    TextField("Pothos", text: $plantName)
                        .foregroundColor(.gray)
                }

                Divider().background(Color.gray)
                
                formRow(title: "Room") {
                    Picker("Room", selection: $selectedRoom) {
                        ForEach(roomOptions, id: \.self) { room in
                            Text(room)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Divider().background(Color.gray)
                
                formRow(title: "Light") {
                    Picker("Light", selection: $selectedLight) {
                        ForEach(lightOptions, id: \.self) { light in
                            Text(light)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Divider().background(Color.gray)
                
                formRow(title: "Watering Days") {
                    Picker("Watering Days", selection: $selectedWateringDays) {
                        ForEach(wateringDayOptions, id: \.self) { days in
                            Text(days)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Divider().background(Color.gray)
                
                formRow(title: "Water") {
                    Picker("Water", selection: $selectedWaterAmount) {
                        ForEach(waterAmountOptions, id: \.self) { amount in
                            Text(amount)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
            }
            .background(Color(UIColor.systemGray5).opacity(0.15))
            .cornerRadius(12)
            .padding()
            
            Spacer()
        }
        .padding(.horizontal)
        .background(Color.black)
        .ignoresSafeArea()
    }
    
    private func formRow<Content: View>(title: String, @ViewBuilder content: () -> Content) -> some View {
        HStack {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
            Spacer()
            content()
        }
        .padding()
    }
}

#Preview {
    welcome()
}





/*import SwiftUI
 
 struct ContentView: View {
     @State private var isShowingSheet = false
     @State private var plantReminders: [PlantReminder] = []
     @State private var showAllDoneScreen = false

     var body: some View {
         NavigationView {
             VStack {
                 HStack {
                     Text("My Plants 🌱")
                         .font(.largeTitle)
                         .fontWeight(.bold)
                         .padding(.leading, 16)
                     Spacer()
                 }
                 .padding(.top, 40)
                 
                 Divider()
                     .background(Color.white)
                     .padding(.horizontal, 16)
                 
                 if showAllDoneScreen {
                     Spacer()
                     VStack {
                         Image(systemName: "leaf.circle.fill")
                             .resizable()
                             .frame(width: 150, height: 150)
                             .foregroundColor(.green)
                         Text("All Done! 🎉")
                             .font(.title)
                             .fontWeight(.bold)
                         Text("All reminders completed.")
                             .font(.subheadline)
                             .foregroundColor(.gray)
                     }
                     Spacer()
                 } else {
                     ReminderListView(plantReminders: $plantReminders, onDelete: handleDelete, onEdit: handleEdit)
                     
                     Button(action: {
                         isShowingSheet = true
                     }) {
                         HStack {
                             Image(systemName: "plus.circle.fill")
                             Text("New Reminder")
                         }
                         .font(.headline)
                         .foregroundColor(.green)
                         .padding()
                     }
                     .sheet(isPresented: $isShowingSheet) {
                         ReminderSheetView(plantReminders: $plantReminders, isEditing: false)
                     }
                 }
             }
             .background(Color.black.edgesIgnoringSafeArea(.all))
             .foregroundColor(.white)
             .onChange(of: plantReminders) { oldValue, newValue in
                 showAllDoneScreen = newValue.isEmpty
             }
             .navigationBarHidden(true)
         }
     }

     private func handleDelete(_ reminder: PlantReminder) {
         plantReminders.removeAll { $0.id == reminder.id }
     }

     private func handleEdit(_ reminder: PlantReminder) {
         isShowingSheet = true
     }
 }

 struct ReminderSheetView: View {
     @Binding var plantReminders: [PlantReminder]
     var isEditing: Bool
     @State private var plantName = ""
     @State private var selectedRoom = "Bedroom"
     @State private var selectedLight = "Full sun"
     @State private var selectedWateringDays = "Every day"
     @State private var selectedWaterAmount = "20-50 ml"
     @Environment(\.presentationMode) var presentationMode

     let roomOptions = ["Bedroom", "Living Room", "Kitchen", "Balcony", "Bathroom"]
     let lightOptions = ["Full sun", "Partial Sun", "Low light"]
     let wateringDayOptions = ["Every day", "Every 2 days", "Every 3 days", "Once a week"]
     let waterAmountOptions = ["20-50 ml", "50-100 ml", "100-200 ml"]

     var body: some View {
         VStack {
             HStack {
                 Button("Cancel") {
                     presentationMode.wrappedValue.dismiss()
                 }
                 .foregroundColor(.white)

                 Spacer()

                 Text(isEditing ? "Edit Reminder" : "Set Reminder")
                     .font(.headline)
                     .foregroundColor(.white)

                 Spacer()

                 Button("Save") {
                     let newReminder = PlantReminder(
                         name: plantName,
                         room: selectedRoom,
                         light: selectedLight,
                         wateringDays: selectedWateringDays,
                         waterAmount: selectedWaterAmount
                     )
                     if isEditing {
                         // Update the existing reminder
                     } else {
                         plantReminders.append(newReminder)
                     }
                     presentationMode.wrappedValue.dismiss()
                 }
                 .foregroundColor(.white)
             }
             .padding()
             
             Divider().background(Color.gray)
             VStack {
                 formRow(title: "Plant Name") {
                     TextField("Pothos", text: $plantName)
                         .foregroundColor(.gray)
                 }
                 formRow(title: "Room") {
                     Picker("Room", selection: $selectedRoom) {
                         ForEach(roomOptions, id: \.self) { Text($0) }
                     }
                 }
                 formRow(title: "Light") {
                     Picker("Light", selection: $selectedLight) {
                         ForEach(lightOptions, id: \.self) { Text($0) }
                     }
                 }
             }
             .background(Color(UIColor.systemGray5).opacity(0.15))
             .cornerRadius(12)
             .padding()
             
             Spacer()
         }
         .padding(.horizontal)
         .background(Color.black)
         .ignoresSafeArea()
     }
 }

 struct ReminderListView: View {
     @Binding var plantReminders: [PlantReminder]
     var onDelete: (PlantReminder) -> Void
     var onEdit: (PlantReminder) -> Void

     var body: some View {
         List {
             ForEach(plantReminders) { reminder in
                 HStack {
                     VStack(alignment: .leading) {
                         Text(reminder.name)
                         HStack {
                             Text("💧 \(reminder.waterAmount)")
                         }
                     }
                     Spacer()
                     Button(action: { onEdit(reminder) }) {
                         Text("Edit")
                     }
                 }
                 .padding()
                 .background(Color(UIColor.systemGray5).opacity(0.1))
                 .cornerRadius(12)
             }
             .onDelete { indexSet in
                 indexSet.map { plantReminders[$0] }.forEach(onDelete)
             }
         }
         .listStyle(PlainListStyle())
     }
 }

 struct PlantReminder: Identifiable, Equatable {
     let id = UUID()
     let name: String
     let room: String
     let light: String
     let wateringDays: String
     let waterAmount: String
 }

 // Definition of formRow function
 private func formRow<Content: View>(title: String, @ViewBuilder content: () -> Content) -> some View {
     HStack {
         Text(title)
             .font(.headline)
             .foregroundColor(.white)
         Spacer()
         content()
     }
     .padding()
 }

 #Preview {
     ContentView()
 }
*/
