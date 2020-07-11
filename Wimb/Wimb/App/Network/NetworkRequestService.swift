//
//  NetworkRequestService.swift
//  Wimb
//
//  Created by Tantia, Himanshu on 11/7/20.
//  Copyright © 2020 Himanshu Tantia. All rights reserved.
//

import Foundation

enum QueryServiceError : Error {
    case invalidURL
    case network(Error?)
}

class QueryService {
    
    private let defaultSession: URLSession
    private var dataTask: URLSessionDataTask?
    private var errorMessage: String?
    
    init(urlSession: URLSession = .shared) {
        self.defaultSession = urlSession
    }
    
    func request(_ endpoint: NextBusEndPoint, handler completionHandler: @escaping (Result<Data, QueryServiceError>) -> Void) {
        guard let url = endpoint.url else {
            return completionHandler(.failure(QueryServiceError.invalidURL))
        }
        
        let task = defaultSession.dataTask(with: url) { data, response, error in
            let result = data.map(Result.success) ??
                        .failure(QueryServiceError.network(error))
            
            completionHandler(result)
        }
        task.resume()
    }
}


public enum JSONValue : Decodable {
    
    case string(String)
    case int(Int)
    case double(Double)
    case bool(Bool)
    case object([String: JSONValue])
    case array([JSONValue])
    
//    public func init2(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if let value = try? container.decode(String.self) {
//            self = .string(value)
//        } else if let value = try? container.decode(Int.self) {
//            self = .int(value)
//        }  else if let value = try? container.decode(Double.self) {
//            self = .double(value)
//        } else if let value = try? container.decode(Bool.self) {
//            self = .bool(value)
//        } else if let value = try? container.decode([String : JSONValue].self) {
//            self = .object(value)
//        } else if let value = try? container.decode([JSONValue].self) {
//            self = .array(value)
//        } else {
//            throw DecodingError.typeMismatch(JSONValue.self, DecodingError.Context(codingPath: container.codingPath, debugDescription: "Not a JSON"))
//        }
//    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self = try ((try? container.decode(String.self)).map(JSONValue.string))
                .or((try? container.decode(Int.self)).map(JSONValue.int))
                .or((try? container.decode(Double.self)).map(JSONValue.double))
                .or((try? container.decode(Bool.self)).map(JSONValue.bool))
                .or((try? container.decode([String : JSONValue].self)).map(JSONValue.object))
                .or((try? container.decode([JSONValue].self)).map(JSONValue.array))
                .resolve(with: DecodingError.typeMismatch(JSONValue.self, DecodingError.Context(codingPath: container.codingPath, debugDescription: "Not a JSON")))
    }
}
