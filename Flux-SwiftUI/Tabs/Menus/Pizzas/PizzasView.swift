import SwiftUI

struct PizzasView: View {
    let menuType: MenuType
    
    var body: some View {
        List {
            Section {
                Text("Hello, World!")
                    .navigationBarTitle(Text(menuType.rawValue.capitalized))
            }
        }
        .listStyle(GroupedListStyle())
    }
}

struct PizzasView_Previews: PreviewProvider {
    static var previews: some View {
        PizzasView(menuType: .light)
    }
}
