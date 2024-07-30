import Foundation
import SwiftUI

extension Text {
    func titleFont() -> some View {
        self
            .font(.system(size: 18, weight: .bold, design: .rounded))
            .foregroundStyle(.primary)
            .opacity(0.8)
    }
    
    func subtitleFont() -> some View {
        self
            .font(.system(size: 15, weight: .regular, design: .rounded))
            .foregroundStyle(.primary)
            .opacity(0.8)
    }
}

struct FontPreview: View {
    var body: some View {
        Text("Title Font")
            .titleFont()
        Text("Subtitle Font")
            .subtitleFont()
    }
}

#Preview {
    FontPreview()
}
