import SwiftUI
import FirebaseFirestoreSwift
import FirebaseFirestore

struct ShopScreen: View {
    
    // MARK: - properties
    @FirestoreQuery(collectionPath: "shop") var items: [Product]
    @EnvironmentObject var vm: ShopViewModel
    let columns = Array(repeating: GridItem(), count: 2)
    
    // MARK: - body
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: columns) {
                    ForEach(items) { item in
                        ProductCartView(product: item)
                    }
                }
            }
            .scrollIndicators(.hidden)
            .padding(.horizontal)
            .background(.secondary.opacity(0.2))
            
            // MARK: - navbar
            .navigationTitle("Shop")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(destination: FavoritesScreen()) {
                        Image(systemName: "heart.fill")
                            .font(.title2)
                    }
                    .buttonStyle(.plain)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: CartScreen()) {
                        Image(systemName: "cart.fill")
                            .font(.title2)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

#Preview {
    ShopScreen()
        .environmentObject(ShopViewModel.shared)
}
