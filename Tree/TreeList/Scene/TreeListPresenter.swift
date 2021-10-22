//
//  TreeListPresenter.swift
//  Tree
//
//  Created by Thibaud Huchon on 11/05/2021.
//

import UIKit

class TreeListPresenter {
    weak var viewController: TreeListViewController?
    
    func presentTreeList(treeList: [Tree]) {
        let viewHolder = TreeListViewHolder(treeList: treeList)
        viewController?.displayTreeList(viewHolder: viewHolder)
    }
    
    func presentLoader() {
        viewController?.displayLoader()
    }
    
    func dismissLoader() {
        viewController?.hideLoader()
    }
    
    func presentTreeDetailsViewController(tree: Tree) {
        viewController?.router.routeToTreeDetailsViewController(tree: tree)
    }
}
