//
//  TreeDetailsModels.swift
//  Tree
//
//  Created by Thibaud Huchon on 18/05/2021.
//

import Foundation

enum TreeDetailsModels {
    struct HeightViewModel {
        let height: Int
        
        func formatData() -> String {
            "\(height) m(s)"
        }
    }
    
    struct RadiusViewModel {
        let radius: Int
        
        func formatData() -> String {
            "\(radius) cm(s)"
        }
    }
}
