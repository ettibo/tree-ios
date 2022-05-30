//
//  TreeListWorker.swift
//  Tree
//
//  Created by Thibaud Huchon on 11/05/2021.
//

import Foundation
import Alamofire

protocol TreeListWorkerProtocol {
    func fetchTrees(startIndex: Int, rows: Int, completionHandler: @escaping ([Tree]) -> Void)
}

class TreeListWorker: TreeListWorkerProtocol {
    
    private let baseUrl = "https://opendata.paris.fr/api/records/1.0/search/?dataset=les-arbres&q=&facet=typeemplacement&facet=domanialite&facet=arrondissement&facet=libellefrancais&facet=genre&facet=espece&facet=varieteoucultivar&facet=circonferenceencm&facet=hauteurenm&facet=stadedeveloppement&facet=remarquable"
    
    func fetchTrees(startIndex: Int, rows: Int, completionHandler: @escaping ([Tree]) -> Void) {
        let paremeters = ["rows": "\(rows)",
        "start": "0"]
        
        let requestCompletionHandler: (AFDataResponse<Any>) -> Void = { response in
            switch response.result {
            case .success(let data):
                var treeList = [Tree]()
                if let dataToRead = data as? [String: Any] {
                    if let records = dataToRead["records"] as? [[String: Any]] {
                        for item in records {
                            treeList.append(Tree(json: item))
                        }
                    }
                }
                completionHandler(treeList)
            case .failure(let error):
                print(error)
            }
        }
        AF.request(baseUrl, method: .get, parameters: paremeters,
                   encoder: URLEncodedFormParameterEncoder.default, headers: nil,
                   interceptor: nil, requestModifier: nil).responseJSON(completionHandler: requestCompletionHandler)
    }
}
