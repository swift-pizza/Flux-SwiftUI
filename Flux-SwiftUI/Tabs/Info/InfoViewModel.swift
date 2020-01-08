import Foundation
import WordPressFlux
import Combine

class InfoViewModel<Service: RemoteService>: ObservableObject {
    @Published private (set) var state: FetchingStatus = .idle

    var sections: [InfoSection] {
        return store.getSections()
    }

    private var storeReceipt: Receipt?
    private let store: InfoStore<Service>

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
