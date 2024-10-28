import SwiftUI

struct ProductDetailView: View {
    
    let product: Product
    
    var body: some View {
        Text(product.name)
    }
}

#Preview {
    ProductDetailView(product: Product.mocData()[0])
}
