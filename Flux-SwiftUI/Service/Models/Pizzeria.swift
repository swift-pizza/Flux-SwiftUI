import Foundation

struct Pizzeria: Codable {
    var menus: [Menu]
}

struct Menu: Codable, Hashable, Identifiable {
    enum MenuType: String, Codable {
        case classic
        case white
        case light
        case special
    }

    var id: UUID
    var type: MenuType
    var title: String
}

struct Pizza: Codable, Identifiable {
    var id: UUID
    var name: String
    var ingredients: String
}
