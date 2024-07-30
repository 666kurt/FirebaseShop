import SwiftUI

struct ProductCartView: View {
    
    let product: Product
    @EnvironmentObject var vm: ShopViewModel
    
    var body: some View {
        GeometryReader { geo in
            let size = geo.size
            
            ZStack(alignment: .bottom) {
                ZStack(alignment: .topTrailing) {
                    if let url = URL(string: product.image) {
                        CartImageView(url: url, height: size.height, width: size.width)
                    }
                    
                    Button(action: {
                        vm.toggleFavotites(product: product)
                    }, label: {
                        Image(systemName: "heart.fill")
                            .padding()
                            .foregroundStyle(product.isFavorite ? .red : .white)
                            .background(.black)
                            .clipShape(Circle())
                            .padding()
                    })
                }
                
                VStack(alignment: .leading) {
                    Text(product.name)
                        .titleFont()
                        .lineLimit(1)
                    Text("$\(product.price)")
                        .subtitleFont()
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.opacity(0.7))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(10)
            }
            
        }
        .frame(height: UIScreen.main.bounds.width * 0.7)
    }
}

#Preview {
    ShopScreen()
        .environmentObject(ShopViewModel.shared)
}
