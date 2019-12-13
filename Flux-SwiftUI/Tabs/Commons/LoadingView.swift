import SwiftUI

struct LoadingView: View {
    @Binding var isAnimating: Bool

    var body: some View {
        VStack {
            ActivityIndicator(isAnimating: $isAnimating, style: .large)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Constants.backgroundColor)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(isAnimating: .constant(true))
    }
}
