import SwiftUI

struct ContentView: View {
    
    @State var selectedTab = "Home"
    let tabs = ["Globe", "Home", "Settings", "Profile"]
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack (alignment: .bottom){
            TabView(selection: $selectedTab){
                FirstView()
                    .tag("Globe")
                VStack{
                    NavigationStack{
                        ProductView()
                            .navigationDestination(for: Product.self){ product in
                            ProductDetailView(product: product)
                            }
                    }
                    .frame(height: 200)
                    CarView()
                }
                .tag("Home")
                SettingsView()
                    .tag("Settings")
                Text("Profile")
                    .tag("Profile")
                    
            }
            HStack{
                ForEach(tabs, id: \.self){ tab in
                    Spacer()
                    TabBarItem(tab: tab, selected: $selectedTab)
                    Spacer()
                }
            }
            .padding(.top, 20)
            .padding(.bottom, 5)
            .frame(maxWidth: .infinity)
            .background(.orange)
        }
    }
}

struct TabBarItem: View {

    @State var tab: String
    @Binding var selected: String
    
    var body: some View {
        if tab == "Profile"{
            Button{
                withAnimation(.spring()){
                    selected = tab
                }
            } label: {
                ZStack{
                    Circle()
                        .frame(width: 34, height: 34)
                        .foregroundColor(selected == tab ? .green : .white)
                }
            }
        } else{
            ZStack{
                Button{
                    withAnimation(.spring()){
                        selected = tab
                    }
                }label: {
                    Image(tab)
                        .resizable()
                        .frame(width: 20, height: 20)
                    if selected == tab{
                        Text(tab)
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                    }
                }
            }
            .opacity(selected == tab ? 1 : 0.7)
            .padding(.vertical, 8)
            .padding(.horizontal, 18)
            .background(selected == tab ? .white : .orange)
            .clipShape(Capsule())
        }
        
    }
}

#Preview {
    ContentView()
}





