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

    @Published private (set) var state: FetchingStatus = .idle
    
    init(store: InfoStore<Service>) {
        self.store = store
        storeReceipt = store.onStateChange { [weak self] (_, state) in
            self?.state = state.status
        }
    }
    
    func fetchInfo() {
        store.onDispatch(InfoStoreAction.fetch)
    }
}
