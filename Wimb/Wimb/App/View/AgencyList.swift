//
//  AgencyList.swift
//  Wimb
//
//  Created by Tantia, Himanshu on 11/7/20.
//  Copyright © 2020 Himanshu Tantia. All rights reserved.
//

import SwiftUI

struct AgencyList: View {
    @ObservedObject var presenter: AgencyListPresenter
    
    var body: some View {
        List (presenter.agencies) { agency in
            self.presenter.linkBuilder(for: agency) {
                AgencyListCell(agency: agency)
            }
        }
    }
}

struct AgencyList_Previews: PreviewProvider {
    
    static var previews: some View {
        let a = Agency(title: "Test", regionTitle: "test", shortTitle: "s test", tag: "tag")
        let interactor = AgencyListInteractor(model: a)
        let presenter = AgencyListPresenter(interactor: interactor)
        return NavigationView {
            AgencyList(presenter: presenter)
        }
    }
}
