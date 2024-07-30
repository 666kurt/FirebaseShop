import Foundation
import FirebaseFirestore

final class ShopViewModel: ObservableObject {
    
    private let db = Firestore.firestore().collection("shop")
    
    static let shared = ShopViewModel()
    private init() {}
    
    func toggleFavotites(product: Product) {
        guard let id = product.id else { return }
        db.document(id).updateData(["isFavorite": !product.isFavorite])
    }
    
}
