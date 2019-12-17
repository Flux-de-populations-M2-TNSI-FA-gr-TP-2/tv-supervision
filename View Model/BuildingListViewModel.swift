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
    
    var buildings = [Building]() {
        didSet {
            didChange.send(self)
        }
    }
    
    private func fetchBuildings() {
        WebService().getAllBuildings{
            self.buildings = $0
        }
    }
    
    let didChange = PassthroughSubject<BuildingListViewModel,Never>()
    
}
