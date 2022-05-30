//
//  Presenters+Injection.swift
//  Tree
//
//  Created by Thibaud HUCHON on 30/05/2022.
//

import Foundation
import Resolver

extension Resolver {
    static func registerPresenters() {
        register { TreeListPresenter() }.implements(TreeListPresenterProtocol.self)
        register { TreeDetailsPresenter() }.implements(TreeDetailsPresenterProtocol.self)
    }
}
