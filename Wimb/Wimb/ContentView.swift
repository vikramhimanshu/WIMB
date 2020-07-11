//
//  ContentView.swift
//  Wimb
//
//  Created by Tantia, Himanshu on 11/7/20.
//  Copyright © 2020 Himanshu Tantia. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            AgencyList(presenter: AgencyListPresenter(interactor: AgencyListInteractor(model: Agency(title: "Testing for first run", regionTitle: "region title", shortTitle: "short ", tag: "tag"))))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
