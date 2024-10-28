import SwiftUI

struct ProductView: View {
    
    @StateObject var data = ModelView()
    
    var body: some View {
        ScrollView(.vertical){
            ForEach(data.allProducts) { product in
                NavigationLink(value: product){
                    ProductTile(product: product)
                }
                .padding(.horizontal, 12)
            }
        }
        .onAppear{
            Task{
                await data.fetchData()
            }
        }
    }
}

struct ProductTile: View {
    
    let product: Product
    
    var body: some View {
        HStack{
            Text(product.name)
                .foregroundStyle(.black)
            Spacer()
            Image(product.image)
                .resizable()
                .frame(width: 40, height: 40)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
        .padding(.horizontal, 24)
        .background(.cyan)
        .cornerRadius(12)
    }
}
    


#Preview {
    NavigationStack{
        ProductView()
    }
}



