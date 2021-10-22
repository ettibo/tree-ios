//
//  TreeListRouter.swift
//  Tree
//
//  Created by Thibaud Huchon on 11/05/2021.
//

import UIKit

class TreeListRouter {
    weak var viewController: UIViewController?
    
    func routeToTreeDetailsViewController(tree: Tree) {
        let vc = TreeDetailsViewController()
        vc.request = tree
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
