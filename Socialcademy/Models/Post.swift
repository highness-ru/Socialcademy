import Foundation

struct Post: Identifiable, Equatable, Codable {
    var title: String
    var content: String
    var author: User
    var isFavorite = false
    var timestamp = Date()
    var id: UUID
    var imageURL: URL?
    
    func contains(_ string: String) -> Bool {
        let properties = [title, content, author.name].map { $0.lowercased() }
        let query = string.lowercased()
        
        let matches = properties.filter { $0.contains(query) }
        return !matches.isEmpty
    }
}

extension Post {
    enum CodingKeys: String, CodingKey {
        case title, content, author, timestamp, id, imageURL
    }
}

extension Post {
    static let testPost = Post(
        title: "Lorem ipsum",
        content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        author: User.testUser, id: UUID()
    )
    
    init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)

            let idString = try container.decode(String.self, forKey: .id)
            self.id = UUID(uuidString: idString) ?? UUID()

            self.title = try container.decode(String.self, forKey: .title)
            self.content = try container.decode(String.self, forKey: .content)
            self.author = try container.decode(User.self, forKey: .author)
            self.timestamp = try container.decode(Date.self, forKey: .timestamp)
            self.imageURL = try container.decodeIfPresent(URL.self, forKey: .imageURL)

            self.isFavorite = false // keep your default
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)

            try container.encode(id.uuidString, forKey: .id)
            try container.encode(title, forKey: .title)
            try container.encode(content, forKey: .content)
            try container.encode(author, forKey: .author)
            try container.encode(timestamp, forKey: .timestamp)
            try container.encodeIfPresent(imageURL, forKey: .imageURL)
        }
}
