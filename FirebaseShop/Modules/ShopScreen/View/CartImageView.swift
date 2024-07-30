import SwiftUI

struct CartImageView: View {
    
    let url: URL
    let height: CGFloat
    let width: CGFloat
    
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        } placeholder: {
            ProgressView()
                .frame(width: width, height: height)
        }
    }
}

