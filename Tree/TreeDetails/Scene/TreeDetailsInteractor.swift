//
//  TreeDetailsInteractor.swift
//  Tree
//
//  Created by Thibaud Huchon on 11/05/2021.
//

import Foundation
import Resolver

protocol TreeDetailsInteractorProtocol {
    var presenter: TreeDetailsPresenterProtocol { get set }
    func processRequest(request: Tree)
}

class TreeDetailsInteractor: TreeDetailsInteractorProtocol {
    @Injected var presenter: TreeDetailsPresenterProtocol
    @Injected private var worker: TreeDetailsWorkerProtocol
    
    func processRequest(request: Tree) {
        let completionHandler: ([String]) -> Void = { [weak self] items in
            self?.presenter.presentItems(items: items)
        }
        worker.fetchData(tree: request, completionHandler: completionHandler)
    }
}
