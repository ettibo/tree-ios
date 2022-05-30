//
//  TreeListRouter.swift
//  Tree
//
//  Created by Thibaud Huchon on 11/05/2021.
//

import UIKit

protocol TreeListRouterProtocol {
    var viewController: UIViewController? { get set }
    func routeToTreeDetailsViewController(tree: Tree)
}

class TreeListRouter: TreeListRouterProtocol {
    weak var viewController: UIViewController?
    
    func routeToTreeDetailsViewController(tree: Tree) {
        let vc = TreeDetailsViewController()
        vc.request = tree
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
