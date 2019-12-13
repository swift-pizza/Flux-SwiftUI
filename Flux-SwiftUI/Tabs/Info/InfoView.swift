import SwiftUI

struct InfoView: View {
    @ObservedObject private var viewModel: InfoViewModel<PizzeriaService>
    
    private let service: PizzeriaService
        
    init(environment: Environment) {
        self.service = PizzeriaService(environment)
        let store: InfoStore<PizzeriaService> = InfoStore(service: self.service)
        self.viewModel = InfoViewModel(store: store)
    }
    
    var body: some View {
        VStack {
            NavigationView {
                viewForState(self.viewModel.state)
                    .navigationBarTitle(Text(Constants.ScreenTitles.info), displayMode: .inline)
                    .navigationViewStyle(StackNavigationViewStyle())
            }
        }
        .onAppear {
            self.viewModel.fetchInfo()
        }
    }
}

private extension InfoView {
    func viewForState(_ state: InfoViewModel<PizzeriaService>.State) -> AnyView {
        switch state {
        case .idle, .loading:
            return AnyView(LoadingView(isAnimating: .constant(true)))
        case .completed(let success):
            if success {
                return AnyView(InfoListView(sections: viewModel.sections))
            }
            return AnyView(Text("Error Loading"))
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(environment: Environment.local)
    }
}
