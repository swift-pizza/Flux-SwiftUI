import Foundation
import WordPressFlux
import Combine

class InfoViewModel<Service: RemoteService>: ObservableObject {
    enum State {
        case idle
        case loading
        case completed(Bool)
    }

    var sections: [InfoSection] {
        return store.getSections()
    }

    private var storeReceipt: Receipt?
    private let store: InfoStore<Service>

    @Published private (set) var state: State = .idle
    
    init(store: InfoStore<Service>) {
        self.store = store
        storeReceipt = store.onStateChange { [weak self] (_, state) in
            switch state.status {
            case .idle:
                self?.state = .idle
            case .fetching:
                self?.state = .loading
            case .fetchingCompleted(let error):
                self?.state = .completed(error == nil)
            }
        }
    }
    
    func fetchInfo() {
        store.onDispatch(InfoStoreAction.fetch)
    }
}
