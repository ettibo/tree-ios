//
//  Routers+Injection.swift
//  Tree
//
//  Created by Thibaud HUCHON on 30/05/2022.
//

import Foundation
import Resolver

extension Resolver {
   static func registerRouters() {
        register { TreeListRouter() }.implements(TreeListRouterProtocol.self)
    }
}
