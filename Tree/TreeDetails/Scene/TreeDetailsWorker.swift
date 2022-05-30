//
//  TreeDetailsWorker.swift
//  Tree
//
//  Created by Thibaud Huchon on 18/05/2021.
//

import Foundation

protocol TreeDetailsWorkerProtocol {
    func fetchData(tree: Tree, completionHandler: ([String]) -> Void)
}

class TreeDetailsWorker: TreeDetailsWorkerProtocol {
    func fetchData(tree: Tree, completionHandler: ([String]) -> Void) {
        var items = [String]()
        if let item = tree.name {
            items.append(item)
        }
        if let item = tree.address {
            items.append(item)
        }
        if let item = tree.type {
            items.append(item)
        }
        if let item = tree.height {
            items.append(TreeDetailsModels.HeightViewModel(height: item).formatData())
        }
        if let item = tree.radius {
            items.append(TreeDetailsModels.RadiusViewModel(radius: item).formatData())
        }
        completionHandler(items)
    }
}
