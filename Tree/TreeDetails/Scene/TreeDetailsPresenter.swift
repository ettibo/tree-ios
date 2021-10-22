//
//  TreeDetailsPresenter.swift
//  Tree
//
//  Created by Thibaud Huchon on 11/05/2021.
//

import Foundation

class TreeDetailsPresenter {
    weak var viewController: TreeDetailsViewController?
    
    func presentItems(items: [String]) {
        let viewHolder = TreeDetailsViewHolder(items: items)
        viewController?.displayItems(viewHolder: viewHolder)
    }
}
