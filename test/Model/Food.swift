import SwiftUI

struct Food: Identifiable, Hashable {
    let id = UUID()
    
    var name: String
    var isFavorite: Bool
    var color: Color
    
    static func good() -> [Food] {
        return [
        Food(name: "Apple", isFavorite: true, color: .red),
        Food(name: "Orange", isFavorite: false, color: .orange),
        Food(name: "Banana", isFavorite: true, color: .yellow),
        Food(name: "Kiwi", isFavorite: false, color: .green)
        ]
    }
    
    static func unhealthy() -> [Food] {
        return [
        Food(name: "Pizza", isFavorite: true, color: .orange),
        Food(name: "Burger", isFavorite: false, color: .green),
        Food(name: "KFC", isFavorite: true, color: .red),
        Food(name: "Kebab", isFavorite: false, color: .brown)
        ]
    }
    
    static func sweet() -> [Food] {
        return [
        Food(name: "IceCream", isFavorite: true, color: .red),
        Food(name: "Muffin", isFavorite: false, color: .orange),
        Food(name: "Cookies", isFavorite: true, color: .yellow),
        Food(name: "Donut", isFavorite: false, color: .green)
        ]
    }
}
