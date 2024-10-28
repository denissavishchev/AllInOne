import Foundation

struct Product: Codable, Identifiable, Hashable{
    static func == (lhs: Product, rhs: Product) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var id = UUID().uuidString
    let name: String
    let price: Double
    let oldPrice: Double
    let weight: Int
    let country: String
    let countryImage: String
    let image: String
    let description: String
    let isDiscount: Bool
    let discount: Int
    let characteristics: Characteristics
    let reviews: Reviews
    
    static func mocData() -> [Product]{
        [
        Product(
            name: "Tea",
            price: 55.9,
            oldPrice: 60,
            weight: 200,
            country: "UK",
            countryImage: "UK",
            image: "tea",
            description: "Tea is an aromatic beverage prepared by pouring hot or boiling water over cured or fresh leaves of Camellia sinensis, an evergreen shrub native to East Asia which probably originated in the borderlands of southwestern China and northern Myanmar. Tea is also made, but rarely, from the leaves of Camellia taliensis.",
            isDiscount: true,
            discount: 5,
            characteristics: Characteristics(production: "India", energyValue: [25, 105], fats: 1.2, squirrels: 2.3, carbohydrates: 0.2),
            reviews: Reviews(
                rating: 4.2,
                count: 19,
                review: [
                    Review(name: "Denis", date: "24.10.28", description: "We really enjoyed the taste of this tea and certainly a very good price. However we have had many broken strings that has not happened with the Tetley tea bags that we usually have. Getting a teaspoon out to fish out the teabag is putting me off buying this product again", rating: 4.8),
                    Review(name: "Leonard", date: "24.10.27", description: "This has been my favourite tea for quite a while. Nice to see it do well in the recommendations. As noted, it has a extremely slight fruity flavour, but certainly not herbal. Different to other black teas, but still a black tea.", rating: 4.9),
                    Review(name: "Daniel", date: "24.09.28", description: "Lacks body. Initially slightly sweet, but left an unpleasant and lingering aftertaste.", rating: 4.5)
                ]
            )
        ),
        
        Product(
            name: "Cookies",
            price: 87.9,
            oldPrice: 160,
            weight: 300,
            country: "PL",
            countryImage: "PL",
            image: "cookies",
            description: "A cookie (American English) or biscuit (British English) is a baked snack or dessert that is typically small, flat, and sweet. It usually contains flour, sugar, egg, and some type of oil, fat, or butter. It may include other ingredients such as raisins, oats, chocolate chips, or nuts. Cookie. Chocolate chip cookies.",
            isDiscount: false,
            discount: 0,
            characteristics: Characteristics(production: "USA", energyValue: [155, 1050], fats: 7.2, squirrels: 3.3, carbohydrates: 0.7),
            reviews: Reviews(
                rating: 4.5,
                count: 13,
                review: [
                    Review(name: "Denis", date: "24.10.28", description: "Came in today for the first time and my goodness I don’t think I could ever eat cookies anywhere else! They had a wonderful variety (including Gluten Free) and I’m sure you can’t go wrong with any choice that you make. They even had treats for my fur babies. Thank…", rating: 4.9),
                    Review(name: "Leonard", date: "24.10.27", description: "Awesome fresh cookies. Support local!", rating: 4.9),
                    Review(name: "Daniel", date: "24.09.28", description: "The company I work for uses their cookies for client thank you gifts. Our clients are always happy and love them. I signed up myself for the monthly cookie tin and it was the best decision! They are so good and I never know what I’m getting and makes me…", rating: 4.7)
                ]
            )
        ),
        
        Product(
            name: "Muffin",
            price: 65.9,
            oldPrice: 90,
            weight: 100,
            country: "DE",
            countryImage: "DE",
            image: "muffin",
            description: "Muffins are single-serving quick breads, which rise with the help of baking soda or baking powder and eggs instead of yeast. They tend to be sweet and somewhat moist, but heavier than a cake or cupcake. Muffins are baked in a pan with cup-sized indentations.",
            isDiscount: true,
            discount: 15,
            characteristics: Characteristics(production: "Germany", energyValue: [245, 1065], fats: 6.2, squirrels: 8.3, carbohydrates: 0.6),
            reviews: Reviews(
                rating: 4.5,
                count: 59,
                review: [
                    Review(name: "Denis", date: "24.10.28", description: "Good sized muffins, moist and soft, fluffy yet with density like an English cake. They're not great but they are good enough. They are sold without a paper cup because they are cooked in a metallic tray. I would recommend you ask a member of staff to heat yours in store to ensure you get the best experience.", rating: 4.8),
                    Review(name: "Leonard", date: "24.10.27", description: "Just looking at them spoiled my appetite. Each is wrapped in plastic film with expiry date stickers stuck on. They were sticky, bready and chewy. What added some taste to them were their fillings. Hazelnut chocolate spread for the chocolate one and jam for the white one. The muffins were way too expensive for what you get. LBP 10,000 for the two.", rating: 4.9),
                    Review(name: "Daniel", date: "24.09.28", description: "To create the best muffin, I would recommend the following: bake them in Starbucks paper cups for a better look; fill them with something sweet like the ones at Costa; make them a more satisfying size like those from Dunkin' Donuts and avoid Pain D'Or's old school paper cases.", rating: 4.5)
                ]
            )
        )
        ]
    }
    
}

struct Characteristics: Codable{
    let production: String
    let energyValue: [Int]
    let fats: Double
    let squirrels: Double
    let carbohydrates: Double
}

struct Reviews: Codable{
    let rating: Double
    let count: Int
    let review: [Review]
}

struct Review: Codable{
    var id = UUID().uuidString
    let name: String
    let date: String
    let description: String
    let rating: Double
}
