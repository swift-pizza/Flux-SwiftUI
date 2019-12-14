import SwiftUI

struct PizzasListView: View {
    let pizzas: [Pizza]
    
    var body: some View {
        List {
            Section {
                ForEach(pizzas) { pizza in
                    PizzaRowView(pizza: pizza)
                        .frame(minHeight: Constants.Cells.height)
                }
            }
        }
    }
}

struct PizzasListView_Previews: PreviewProvider {
    static var previews: some View {
        PizzasListView(pizzas: [Pizza(id: UUID(),
                                      name: "Margherita",
                                      ingredients: "Pomodoro, Origano, Mozzarella")])
    }
}
