import UIKit
import SwiftUI

enum CustomColor: String {
    case red
    case lightRed
    case yellow
    case darkYellow
}

extension UIColor {
    static func customUIColor(_ color: CustomColor) -> UIColor {
        guard let uiColor = UIColor(named: color.rawValue) else {
            fatalError("A color should exist")
        }
        return uiColor
    }
}

extension Color {
    static func customColor(_ color: CustomColor) -> Color {
        guard let uiColor = UIColor(named: color.rawValue) else {
            fatalError("A color should exist")
        }
        return Color(uiColor)
    }
}
