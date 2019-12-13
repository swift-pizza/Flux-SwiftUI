import SwiftUI

struct InfoListView: View {
    let sections: [InfoSection]
    
    @State var selectedInfo: Info?
    
    var body: some View {
        List {
            ForEach(sections) { section in
                Section(header: Text(section.title.uppercased())) {
                    ForEach(section.info) { info in
                        Button(action: {
                            self.selectedInfo = info
                        }) {
                            InfoRow(info: info)
                        }
                        .frame(height: Constants.Cells.height)
                    }
                }
            }
        }.sheet(item: $selectedInfo, content: { info in
            SafariView(url: URL(string: info.url))
        })
        .listStyle(GroupedListStyle())
    }
}

struct InfoListView_Previews: PreviewProvider {
    static let sections = [InfoSection(id: UUID(),
                                title: "Section",
                                info: [Info(id: UUID(),
                                            title: "Info",
                                            icon: "github",
                                            url: "https://github.com/danielebogo")])]
    static var previews: some View {
        InfoListView(sections: sections)
    }
}

private struct InfoRow: View {
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
