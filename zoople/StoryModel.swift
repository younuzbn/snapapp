import Foundation

// MARK: - Welcome
struct Story: Codable {
    let data: [StoryModel]
    let total, page, limit: Int
}

// MARK: - Datum
struct StoryModel: Codable {
    let id: String
    let image: String
    let likes: Int
    let tags: [String]
    let text, publishDate: String
    let owner: Owner1
}

// MARK: - Owner
struct Owner1: Codable {
    let id, title, firstName, lastName: String
    let picture: String
}
