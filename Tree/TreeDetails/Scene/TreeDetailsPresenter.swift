//
//  TreeDetailsPresenter.swift
//  Tree
//
//  Created by Thibaud Huchon on 11/05/2021.
//

import Foundation

protocol TreeDetailsPresenterProtocol {
    var viewController: TreeDetailsViewControllerProtocol? { get set }
    func presentItems(items: [String])
}

class TreeDetailsPresenter: TreeDetailsPresenterProtocol {
    var viewController: TreeDetailsViewControllerProtocol?
    
    func presentItems(items: [String]) {
        let viewHolder = TreeDetailsViewHolder(items: items)
        viewController?.displayItems(viewHolder: viewHolder)
    }
}
