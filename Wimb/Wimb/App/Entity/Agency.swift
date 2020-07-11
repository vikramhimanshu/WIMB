//
//  Agency.swift
//  Wimb
//
//  Created by Tantia, Himanshu on 11/7/20.
//  Copyright © 2020 Himanshu Tantia. All rights reserved.
//

import Foundation

struct Agency : Codable, Identifiable {
    let id: UUID = UUID()
    
    let title: String
    let regionTitle: String
    var shortTitle: String?
    let tag: String
}
