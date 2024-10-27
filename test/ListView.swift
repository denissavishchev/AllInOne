import SwiftUI

struct ListView: View {
    
    @State private var good = Food.good()
    @State private var unhealthy = Food.unhealthy()
    @State private var sweet = Food.sweet()
    
    var body: some View {
        List{
            Section {
                ForEach(good){ food in
                    FoodRow(food: food)
                }
                .listRowBackground(Capsule()
                    .fill(Color(white: 1, opacity: 0.5))
                    .padding(.vertical, 2))
                .listRowSeparator(.hidden)
            } header: {
                Text("Good")
            } footer: {
                Text("Don't eat this")
            }
            
            Section {
                ForEach(unhealthy){ food in
                    FoodRow(food: food)
                }
                .listRowSeparatorTint(.green)
                .listRowInsets(.init(top: 0, leading: 60, bottom: 0, trailing: 60))
                .listRowBackground(Color(.red.opacity(0.2)))
            } header: {
                Text("Unhealthy")
            }
            
            Section {
                ForEach(sweet){ food in
                    FoodRow(food: food)
                }
                .listRowSeparator(.hidden)
            } header: {
                Text("Sweet")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .shadow(radius: 5)
            }
            .listRowInsets(.init(top: 10, leading: 40, bottom: 0, trailing: 40))
            .headerProminence(.increased)
        }
        .environment(\.defaultMinListRowHeight, 50)
        .environment(\.defaultMinListHeaderHeight, 70)
        .scrollContentBackground(.hidden)
        .background(Color(.yellow.opacity(0.4)))
    }
}

struct FoodRow: View {
    
    let food: Food
    
    var body: some View {
        HStack{
            Text(food.name).foregroundStyle(food.color)
            Spacer()
            Image(systemName: food.isFavorite ? "heart.fill" : "heart")
            
        }
    }
}

#Preview {
    ListView()
}
