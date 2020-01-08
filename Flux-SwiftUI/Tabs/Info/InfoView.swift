import SwiftUI

protocol A {
    init<Service: RemoteService>(service: Service)
}

struct N: A {
    init<Service: RemoteService>(service: Service) {
        let store: InfoStore<Service> = InfoStore(service: service)
    }
}

struct InfoView: View {
    @ObservedObject private var viewModel: InfoViewModel<PizzeriaService>
        
    init(service: PizzeriaService) {
        let store: InfoStore<PizzeriaService> = InfoStore(service: service)
        self.viewModel = InfoViewModel(store: store)
    }
    
    var body: some View {
        NavigationView {
            viewForState(self.viewModel.state)
                .navigationBarTitle(Text(Constants.ScreenTitles.info), displayMode: .inline)
                .navigationViewStyle(StackNavigationViewStyle())
        }
        .onAppear {
            self.viewModel.fetchInfo()
        }
    }
}

private extension InfoView {
    func viewForState(_ state: FetchingStatus) -> AnyView {
        switch state {
        case .idle, .fetching:
            return AnyView(LoadingView(isAnimating: .constant(true)))
        case .fetchingCompleted(let error):
            guard let error = error else {
                return AnyView(InfoListView(sections: viewModel.sections))
            }
            return AnyView(Text(error.localizedDescription))
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(service: PizzeriaService(Environment.local))
    }
}
