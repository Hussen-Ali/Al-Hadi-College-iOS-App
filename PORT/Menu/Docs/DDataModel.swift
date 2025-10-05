
struct DocumentResponse: Codable {
    let documents: [Document]
    let msg: String?
}

struct Document: Codable {
    let name: String?
    let file: String?
    let thumbnail: String?
    let page_count: Int?
}

