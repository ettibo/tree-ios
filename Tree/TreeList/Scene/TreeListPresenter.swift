//
//  TreeListPresenter.swift
//  Tree
//
//  Created by Thibaud Huchon on 11/05/2021.
//

import UIKit

protocol TreeListPresenterProtocol {
    var viewController:  TreeListViewControllerProtocol? { get set }
    func presentTreeList(treeList: [Tree])
    func presentLoader()
    func dismissLoader()
    func presentTreeDetailsViewController(tree: Tree)
}

class TreeListPresenter: TreeListPresenterProtocol {
    var viewController: TreeListViewControllerProtocol?
    
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
