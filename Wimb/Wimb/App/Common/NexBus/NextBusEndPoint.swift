//
//  NextBusEndPoint.swift
//  Wimb
//
//  Created by Tantia, Himanshu on 11/7/20.
//  Copyright © 2020 Himanshu Tantia. All rights reserved.
//

import Foundation

struct NextBusEndPoint {
    let path: String = "/service/publicJSONFeed"
    let queryItems: [URLQueryItem]
}

extension NextBusEndPoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "webservices.nextbus.com"
        components.path = path
        components.queryItems = queryItems
        
        return components.url
    }
}

extension NextBusEndPoint {
    static func agencyList() -> NextBusEndPoint {
        return NextBusEndPoint(queryItems: [
            URLQueryItem(name: "command", value: "agencyList")
        ])
    }
    
    static func routeList(forAgency a:Agency) -> NextBusEndPoint {
        return NextBusEndPoint(queryItems: [
            URLQueryItem(name: "command", value: "routeList"),
            URLQueryItem(name: "a", value: a.tag)
        ])
    }
    
    static func routeConfig(forAgency a: Agency,
                            route r: Route) -> NextBusEndPoint {
        return NextBusEndPoint(queryItems: [
            URLQueryItem(name: "command", value: "routeConfig"),
            URLQueryItem(name: "a", value: a.tag),
            URLQueryItem(name: "r", value: r.tag),
        ])
    }
}
