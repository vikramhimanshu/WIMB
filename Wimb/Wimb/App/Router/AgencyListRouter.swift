//
//  AgencyListRouter.swift
//  Wimb
//
//  Created by Tantia, Himanshu on 11/7/20.
//  Copyright © 2020 Himanshu Tantia. All rights reserved.
//

import Foundation
import SwiftUI

class AgencyListRouter {
  func makeDetailView(for agency: Agency) -> some View {
    let presenter = AgencyListPresenter(interactor:
      AgencyListInteractor(model: agency))
    return AgencyList(presenter: presenter)
  }
}
