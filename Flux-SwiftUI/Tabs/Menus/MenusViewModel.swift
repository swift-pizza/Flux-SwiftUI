import Foundation
import WordPressFlux
import Combine

class MenusViewModel<Service: RemoteService>: ObservableObject {
    @Published var state: FetchingStatus = .idle

    var menus: [Menu] {
        return store.getMenus()
    }
    
    private var getMenusReceipt: Receipt?
    private var storeReceipt: Receipt?
    private(set) var store: PizzeriaStore<Service>
    
    init(store: PizzeriaStore<Service>) {
        self.store = store
        storeReceipt = store.onChange { [weak self] in
            self?.updateState()
        }
    }
    
    func fetchMenus() {
        getMenusReceipt = store.query(.getMenus)
    }
    
    func reloadMenus() {
        store.onDispatch(PizzeriaStoreAction.reloadMenus)
    }
}

private extension MenusViewModel {
    func updateState() {
        state = store.fetchingMenusStatus()
    }
}
