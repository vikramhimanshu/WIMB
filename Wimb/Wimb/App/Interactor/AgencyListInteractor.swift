//
//  AgencyListInteractor.swift
//  Wimb
//
//  Created by Tantia, Himanshu on 11/7/20.
//  Copyright © 2020 Himanshu Tantia. All rights reserved.
//

import Foundation

class AgencyListInteractor {
    struct AgencyListEntity : Decodable {
        let agency: [Agency]
        let copyright: String
    }
    
    let model: Agency
    let network: QueryService
    
    init(model: Agency) {
        network = QueryService()
        self.model = model
    }
    
    func getAgencies(handler completionHandler: @escaping (Result<[Agency], Error>) -> Void) {
        network.request(.agencyList()) { result in
            do {
                let data = try result.get()
//                let d = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<String, Any>
//                if let a = d?["agency"] as? Array<Dictionary<String, String>> {
//                    print(a)
//                }
                let agency = try JSONDecoder().decode(AgencyListEntity.self, from: data)
                completionHandler(.success(agency.agency))
            } catch {
                print(error.localizedDescription)
                completionHandler(.failure(error))
            }
        }
    }
}
