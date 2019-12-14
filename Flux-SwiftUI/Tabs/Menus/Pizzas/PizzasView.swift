import SwiftUI

struct PizzasView: View {
    @ObservedObject private var viewModel: PizzasViewModel<PizzeriaService>
    
    private let menuType: MenuType
    
    init(store: PizzeriaStore<PizzeriaService>, menuType: MenuType) {
        self.viewModel = PizzasViewModel(store: store, menuType: menuType)
        self.menuType = menuType
    }
    
    var body: some View {
        PizzasListView(pizzas: self.viewModel.getPizzas(for: self.menuType))
            .navigationBarTitle(Text(menuType.rawValue.capitalized))
            .listStyle(GroupedListStyle())
            .onAppear {
                self.viewModel.fetchPizzas(for: self.menuType)
        }
    }
}

struct PizzasView_Previews: PreviewProvider {
    static let store: PizzeriaStore<PizzeriaService> = PizzeriaStore(service: PizzeriaService(Environment.local))

    static var previews: some View {
        PizzasView(store: self.store, menuType: .light)
    }
}
