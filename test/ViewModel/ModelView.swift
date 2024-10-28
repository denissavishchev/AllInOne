import Foundation

final class ModelView: ObservableObject{
    
    @Published private(set) var allProducts: [Product] = []
    
    func fetchData() async{
        guard let downloadProduct: [Product] = await NetworkService.shared.downloadData() else {return}
        
        allProducts = downloadProduct
    }
}
