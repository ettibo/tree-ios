//
//  Worker+Injection.swift
//  Tree
//
//  Created by Thibaud HUCHON on 30/05/2022.
//

import Foundation
import Resolver

extension Resolver {
    static func registerWorkers() {
        register { TreeListWorker() }.implements(TreeListWorkerProtocol.self)
        register { TreeDetailsWorker() }.implements(TreeDetailsWorkerProtocol.self)
    }
}
