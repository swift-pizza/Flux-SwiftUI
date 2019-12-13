import SwiftUI

struct MenusView: View {
    @ObservedObject private var viewModel: MenusViewModel<PizzeriaService>
    
    init(service: PizzeriaService) {
        let store: PizzeriaStore<PizzeriaService> = PizzeriaStore(service: service)
        self.viewModel = MenusViewModel(store: store)
    }
    
    var body: some View {
        NavigationView {
            viewForState(self.viewModel.state)
                .navigationBarTitle(Text(Constants.ScreenTitles.project), displayMode: .inline)
                .navigationViewStyle(StackNavigationViewStyle())
        }
        .onAppear {
            self.viewModel.fetchMenus()
        }
    }
}

private extension MenusView {
    func viewForState(_ state: FetchingStatus) -> AnyView {
        switch state {
        case .idle, .fetching:
            return AnyView(LoadingView(isAnimating: .constant(true)))
        case .fetchingCompleted(let error):
            guard let error = error else {
                return AnyView(MenusListView(sections: viewModel.menus))
            }
            return AnyView(Text(error.localizedDescription))
        }
    }
}

struct MenusView_Previews: PreviewProvider {
    static var previews: some View {
        MenusView(service: PizzeriaService(Environment.local))
    }
}
