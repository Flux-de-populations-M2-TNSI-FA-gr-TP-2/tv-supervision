//
//  BuildingListViewModel.swift
//  monitoring
//
//  Created by Aymeric Vanderkelen on 17/12/2019.
//  Copyright © 2019 Aymeric Vanderkelen. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

final class BuildingListViewModel : ObservableObject {
    
    init(){
        fetchBuildings()
    }

    var objectWillChange = PassthroughSubject<Void, Never>()

    var buildings: [Building] = [] {
        willSet {
            self.objectWillChange.send()
        }
    }
    
    private func fetchBuildings() {
        WebService().getAllBuildings{
            self.buildings = $0
            print("list: \(self.buildings)")
        }
    }
    
}
