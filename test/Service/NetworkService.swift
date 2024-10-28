import Foundation

final class NetworkService{
    static let shared = NetworkService()
    
    private init() {}
    
    func downloadData() async -> [Product]? {
        return Product.mocData()
    }
}
