import SwiftUI

struct AppTabView: View {
    private let service = PizzeriaService(Environment.local)
    
    var body: some View {
        TabView {
            MenusView(service: service)
                .tabItem {
                    Image.tintableImage("tab-swift")
                    Text("Menus")
            }
            InfoView(service: service)
                .tabItem {
                    Image.tintableImage("tab-info")
                    Text("Info")
            }
        }
        .accentColor(.customColor(.red))
        .edgesIgnoringSafeArea(.top)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
