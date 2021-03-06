import Foundation

struct Info: Codable, Identifiable {
    var id: UUID
    var title: String
    var icon: String
    var url: String
}

struct InfoSection: Codable, Identifiable {
    var id: UUID
    var title: String
    var info: [Info]
}

struct About: Codable {
    var sections: [InfoSection]
}
