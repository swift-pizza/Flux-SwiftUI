import SwiftUI

struct MenusListView: View {
    let sections: [Menu]
    let store: PizzeriaStore<PizzeriaService>
    
    var body: some View {
        List {
            ForEach(sections) { menu in
                Section(header: Text(menu.type.rawValue.uppercased())) {
                    NavigationLink(destination: PizzasView(store: self.store, menuType: menu.type)) {
                        Text(menu.title)
                            .font(.body)
                            .foregroundColor(.customColor(.red))
                            .frame(height: Constants.Cells.height)
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
    }
}

struct MenusListView_Previews: PreviewProvider {
    static let store: PizzeriaStore<PizzeriaService> = PizzeriaStore(service: PizzeriaService(Environment.local))

    static var previews: some View {
        MenusListView(sections: [Menu(id: UUID(),
                                      type: .classic,
                                      title: "Classic Pizzas"),
                                 Menu(id: UUID(),
                                      type: .light,
                                      title: "Light Pizzas")],
                      store: store)
    }
}
