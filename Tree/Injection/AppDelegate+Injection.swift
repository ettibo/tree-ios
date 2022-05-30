//
//  AppDelegate+Injection.swift
//  Tree
//
//  Created by Thibaud HUCHON on 30/05/2022.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerInteractors()
        registerRouters()
        registerPresenters()
        registerWorkers()
    }
}
