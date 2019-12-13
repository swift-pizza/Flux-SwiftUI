import SwiftUI

struct MenusListView: View {
    let sections: [Menu]
    
    var body: some View {
        List {
            ForEach(sections) { menu in
                Section(header: Text(menu.type.rawValue.uppercased())) {
                    Text(menu.title)
                        .font(.body)
                        .foregroundColor(.customColor(.red))
                        .frame(height: Constants.Cells.height)
                }
            }
        }
        .listStyle(GroupedListStyle())
    }
}

struct MenusListView_Previews: PreviewProvider {
    static var previews: some View {
        MenusListView(sections: [Menu(id: UUID(),
                                      type: .classic,
                                      title: "Classic Pizzas"),
                                 Menu(id: UUID(),
                                      type: .light,
                                      title: "Light Pizzas")])
    }
}
