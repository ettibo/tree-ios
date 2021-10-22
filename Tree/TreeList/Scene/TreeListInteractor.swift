//
//  TreeListInteractor.swift
//  Tree
//
//  Created by Thibaud Huchon on 11/05/2021.
//

import Foundation

class TreeListInteractor {
    let presenter = TreeListPresenter()
    private let worker = TreeListWorker()
    
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
