import SwiftUI

struct RatingPicker: View {

    @State private var rating = 3
    
    var body: some View {
        HStack{
            ForEach(1..<6){ i in
                Star(fill: fillingFor(i))
                    .onTapGesture {
                        rating = i
                    }
            }
        }
    }
    
    private func fillingFor(_ index: Int) -> Bool {
        index <= rating
    }
    
}

struct Star: View {
    
    let fill: Bool
    
    var body: some View {
        Image(systemName: fill ? "star.fill" : "star")
            .resizable()
            .frame(width: 40, height: 40)
            .foregroundStyle(.yellow)
            .frame(width: 52, height: 52)
    }
}


#Preview {
    RatingPicker().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
