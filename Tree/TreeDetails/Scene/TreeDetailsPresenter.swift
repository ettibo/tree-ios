//
//  TreeDetailsPresenter.swift
//  Tree
//
//  Created by Thibaud Huchon on 11/05/2021.
//

import Foundation
import UIKit

protocol TreeDetailsPresenterProtocol {
    var viewController: UIViewController? { get set }
    func presentItems(items: [String])
}

class TreeDetailsPresenter: TreeDetailsPresenterProtocol {
    weak var viewController: UIViewController?
    
    func presentItems(items: [String]) {
        let viewHolder = TreeDetailsViewHolder(items: items)
        (viewController as? TreeDetailsViewControllerProtocol)?.displayItems(viewHolder: viewHolder)
    }
}
