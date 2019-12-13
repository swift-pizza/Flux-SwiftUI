import SwiftUI

struct InfoRow: View {
    let info: Info
    
    var body: some View {
        HStack {
            Image.tintableImage(info.icon)
                .foregroundColor(.customColor(.darkYellow))
            VStack(alignment: .leading) {
                Text(info.title)
                    .foregroundColor(.customColor(.red))
                    .font(.body)
                Text(info.url)
                    .foregroundColor(.gray)
                    .font(.caption)
                    .lineLimit(1)
            }
            Spacer()
                .frame(width: 15.0)
        }
    }
}

struct InfoRow_Previews: PreviewProvider {
    static let info = Info(id: UUID(),
                           title: "Info",
                           icon: "github",
                           url: "https://github.com/danielebogo")
    
    static var previews: some View {
        InfoRow(info: info)
            .previewLayout(.fixed(width: 320, height: Constants.Cells.height))
    }
}
