import UIKit
import SwiftUI

extension Image {
    static func tintableImage(_ imageName: String) -> Image {
        guard let img = UIImage(named: imageName) else {
            fatalError("Unable to load image")
        }
        return Image(uiImage: img.withRenderingMode(.alwaysTemplate))
    }
}
