//
//  Interactors+Injection.swift
//  Tree
//
//  Created by Thibaud HUCHON on 30/05/2022.
//

import Foundation
import Resolver

extension Resolver {
    static func registerInteractors() {
        register { TreeListInteractor() }.implements(TreeListInteractorProtocol.self)
        register { TreeDetailsInteractor() }.implements(TreeDetailsInteractorProtocol.self)
    }
}
