//
//  TreeDetailsInteractor.swift
//  Tree
//
//  Created by Thibaud Huchon on 11/05/2021.
//

import Foundation

class TreeDetailsInteractor {
    let presenter = TreeDetailsPresenter()
    private let worker = TreeDetailsWorker()
    
    func processRequest(request: Tree) {
        let completionHandler: ([String]) -> Void = { [weak self] items in
            self?.presenter.presentItems(items: items)
        }
        worker.fetchData(tree: request, completionHandler: completionHandler)
    }
}
