//
//  Tree.swift
//  Tree
//
//  Created by Thibaud Huchon on 11/05/2021.
//

import Foundation

struct Tree {
    var name: String?
    var type: String?
    var address: String?
    var height: Int?
    var radius: Int?
    
    init(json: [String: Any]) {
        if let fields = json["fields"] as? [String: Any] {
            name = fields["libellefrancais"] as? String
            type = fields["espece"] as? String
            address = fields["adresse"] as? String
            height = fields["hauteurenm"] as? Int
            radius = fields["circonferenceencm"] as? Int
        }
    }
}
