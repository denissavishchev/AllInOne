import SwiftUI

struct SelectedListView: View {
    @State private var food = Food.sweet()
    @State private var id: UUID? = nil
    
    var body: some View {
        List(food, selection: $id) { food in
            FoodRow(food: food)
                .listRowBackground(id == food.id ? Color(.green) : Color(.tertiarySystemBackground))
        }
    }
}

#Preview {
    SelectedListView()
}
