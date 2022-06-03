//
//  TreeListPresenter.swift
//  Tree
//
//  Created by Thibaud Huchon on 11/05/2021.
//

import UIKit

protocol TreeListPresenterProtocol {
    var viewController:  UIViewController? { get set }
    func presentTreeList(treeList: [Tree])
    func presentLoader()
    func dismissLoader()
    func presentTreeDetailsViewController(tree: Tree)
}

class TreeListPresenter: TreeListPresenterProtocol {
    weak var viewController: UIViewController?
    
    func presentTreeList(treeList: [Tree]) {
        let viewHolder = TreeListViewHolder(treeList: treeList)
        (viewController as? TreeListViewControllerProtocol)?.displayTreeList(viewHolder: viewHolder)
    }
    
    func presentLoader() {
        (viewController as? TreeListViewControllerProtocol)?.displayLoader()
    }
    
    func dismissLoader() {
        (viewController as? TreeListViewControllerProtocol)?.hideLoader()
    }
    
    func presentTreeDetailsViewController(tree: Tree) {
        (viewController as? TreeListViewControllerProtocol)?.router.routeToTreeDetailsViewController(tree: tree)
    }
}
