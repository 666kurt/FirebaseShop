import Foundation
import FirebaseFirestoreSwift

struct Product: Identifiable, Codable {
    @DocumentID var id: String?
    let name: String
    let description: String
    let image: String
    let price: Int
    let isFavorite: Bool
    let quantity: Int?
}
