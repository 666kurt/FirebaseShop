import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct FavoritesScreen: View {
    
    @FirestoreQuery(collectionPath: "shop",
                    predicates: [.isEqualTo("isFavorite", true)]) private var favoriteItems: [Product]
    private let columns = Array(repeating: GridItem(), count: 2)
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns) {
                ForEach(favoriteItems) { item in
                       ProductCartView(product: item)
                }
            }
        }
        .navigationTitle("Favorites")
        .scrollIndicators(.hidden)
        .padding(.horizontal)
        .background(.secondary.opacity(0.2))
    }
}

#Preview {
    FavoritesScreen()
}
