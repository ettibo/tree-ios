//
//  TreeListInteractor.swift
//  Tree
//
//  Created by Thibaud Huchon on 11/05/2021.
//

import Foundation
import Resolver

protocol TreeListInteractorProtocol {
    var presenter: TreeListPresenterProtocol { get set }
    func fetchData()
    func onTreeSelected(tree: Tree?)
}

class TreeListInteractor: TreeListInteractorProtocol {
    @Injected var presenter: TreeListPresenterProtocol
    @Injected private var worker: TreeListWorkerProtocol
    
    func fetchData() {
        let completionHandler: ([Tree]) -> Void = { [weak self] treeList in
            self?.presenter.dismissLoader()
            self?.presenter.presentTreeList(treeList: treeList)
        }
        presenter.presentLoader()
        worker.fetchTrees(startIndex: 0, rows: 25, completionHandler: completionHandler)
    }
    
    func onTreeSelected(tree: Tree?) {
        guard let tree = tree else { return }
        presenter.presentTreeDetailsViewController(tree: tree)
    }
}
