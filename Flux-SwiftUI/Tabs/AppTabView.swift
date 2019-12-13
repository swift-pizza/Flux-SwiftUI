import SwiftUI

struct AppTabView: View {
    let environment: Environment
    
    var body: some View {
        TabView {
            MenusView()
                .tabItem {
                    Image.tintableImage("tab-swift")
                    Text("Menus")
            }
            InfoView(environment: environment)
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
        AppTabView(environment: Constants.environment)
    }
}
