import SwiftUI



struct ContentView: View {
    @State private var toggles: [Bool] = [true, false, false, false]
    
    var body: some View {
        GeometryReader{ geometry in
            VStack {
                VStack {
                    Image("Globe")
                        .resizable()
                        .foregroundColor(.customBlue)
                        .frame(width: 64, height: 64)
                        .padding(2)
                        .background(.customLightBlue)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .padding(EdgeInsets(top: 24, leading: 0, bottom: 4, trailing: 0))
                    Text("Devis FromEarth")
                        .foregroundStyle(.white)
                        .bold()
                        .font(.system(size: 18))
                    Text("Mobile developer")
                        .foregroundStyle(.white)
                        .bold()
                        .font(.system(size: 12))
                        .padding(.top, 1)
                    HStack{
                        Spacer()
                        CounterView(count: "75K", text: "Followers")
                        Spacer()
                        CounterView(count: "16K", text: "Following")
                        Spacer()
                        CounterView(count: "600", text: "Projects")
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 8, leading: 24, bottom: 24, trailing: 24))
                }
                .frame(minWidth: 0, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: geometry.size.height * 0.3)
                .background(LinearGradient(gradient: Gradient(
                    colors: [.customBlue, .customDarkBlue]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing))
                .cornerRadius(18)
                .padding(EdgeInsets(top: 12, leading: 12, bottom: 0, trailing: 12))
                HStack{
                    TileView(
                        name: "May 30, 2022",
                        value: 0.4,
                        isChecked: toggles[0],
                        index: 0,
                        toggles: $toggles
                    )
                    Spacer()
                    TileView(
                        name: "May 36, 2022",
                        value: 0.8,
                        isChecked: toggles[1],
                        index: 1,
                        toggles: $toggles
                    )
                }.padding(EdgeInsets(top: 4, leading: 14, bottom: 0, trailing: 14))
                HStack{
                    TileView(
                        name: "May 31, 2022",
                        value: 0.6,
                        isChecked: toggles[2],
                        index: 2,
                        toggles: $toggles
                    )
                    Spacer()
                    TileView(
                        name: "May 32, 2022",
                        value: 0.1,
                        isChecked: toggles[3],
                        index: 3,
                        toggles: $toggles
                    )
                }.padding(EdgeInsets(top: 4, leading: 14, bottom: 0, trailing: 14))
                ListView()
                Spacer()
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .background(Color(.white))
        }
    }
}

#Preview {
    ContentView()
}


struct TileView: View {
    
    let name: String
    let value: Double
    @State var isChecked: Bool
    let index: Int
    @Binding var toggles: [Bool]
    
    var body: some View {
        
        VStack {
          Text(name)
            ProgressView(value: value)
        }
        .frame(width: 180, height: 100)
        .background(Color(toggles[index] ? .customBlue : .customLightBlue))
        .cornerRadius(18)
        .onTapGesture {
            toggles = [false, false, false, false]
            toggles[index] = true
            print(toggles)
        }
    }
}


struct CounterView: View {
    
    let count: String
    let text: String
    
    var body: some View {
        VStack{
            Text(count)
                .foregroundStyle(.white)
                .bold()
                .font(.system(size: 18))
            Text(text)
                .foregroundStyle(.white)
                .bold()
                .font(.system(size: 12))
        }
    }
}



