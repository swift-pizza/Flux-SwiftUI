import SwiftUI

struct PizzaRowView: View {
    let pizza: Pizza

    var body: some View {
        VStack(alignment: .leading) {
            Text(pizza.name)
                .foregroundColor(.customColor(.red))
                .font(.body)
            Text(pizza.ingredients)
                .lineLimit(nil)
                .foregroundColor(.gray)
                .font(.caption)
        }
    }
}

struct PizzaRowView_Previews: PreviewProvider {
    static var previews: some View {
        PizzaRowView(pizza: Pizza(id: UUID(),
                                  name: "Margherita",
                                  ingredients: "Pomodoro, Origano, Mozzarella, Lorem ipsum dolor sit amet"))
            .previewLayout(.fixed(width: 320, height: Constants.Cells.height + 50))
    }
}
