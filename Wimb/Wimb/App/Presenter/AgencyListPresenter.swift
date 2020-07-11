//
//  AgencyListPresenter.swift
//  Wimb
//
//  Created by Tantia, Himanshu on 11/7/20.
//  Copyright © 2020 Himanshu Tantia. All rights reserved.
//

import Foundation
import SwiftUI

class AgencyListPresenter : ObservableObject {
    private let interactor: AgencyListInteractor
    private let router: AgencyListRouter
    
    @Published var agencies: [Agency] = []
    
    init(interactor: AgencyListInteractor) {
        self.interactor = interactor
        self.router = AgencyListRouter()
        interactor.getAgencies() { result in
            do {
                let a = try result.get()
                DispatchQueue.main.sync {
                    self.agencies = a
                }
            } catch {
                print(error)
            }
        }
    }
    
    func linkBuilder<Content: View>(for agency: Agency, @ViewBuilder content: () -> Content) -> some View {
        NavigationLink(destination: router.makeDetailView(for: agency)) {
            content()
        }
    }
}
