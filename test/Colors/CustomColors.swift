import SwiftUI

enum CustomColors: String {
    case darkBlue = "customDarkBlue"
    case blue = "customBlue"
    case lightBlue = "customLightBlue"
}

extension Color {
    init(_ name: CustomColors) {
        self.init(name.rawValue)
    }
}
