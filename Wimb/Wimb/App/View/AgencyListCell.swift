//
//  AgencyListCell.swift
//  Wimb
//
//  Created by Tantia, Himanshu on 11/7/20.
//  Copyright © 2020 Himanshu Tantia. All rights reserved.
//

import SwiftUI

struct AgencyListCell: View {
    var agency: Agency
    
    var body: some View {
        Text("\(agency.title) : \(agency.tag)")
    }
}

struct AgencyListCell_Previews: PreviewProvider {
    static var previews: some View {
        let agency = Agency(title: "Test Agency Title", regionTitle: "Test Agency Region", shortTitle: "short title", tag: "tag")
        return AgencyListCell(agency: agency)
            .frame(height: 60)
    }
}
