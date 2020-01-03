//
//  RoomListView.swift
//  monitoring
//
//  Created by Aymeric Vanderkelen on 18/12/2019.
//  Copyright © 2019 Aymeric Vanderkelen. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

final class RoomListViewModel : ObservableObject {
    
    init(buildingId: Int){
        fetchAll(buildingId: buildingId)
    }
    
    var rooms = [Room]() {
        willSet {
            self.objectWillChange.send()
        }
    }
    var events = [Event](){
        willSet {
            self.objectWillChange.send()
        }
    }
    
    var name = String(){
        willSet {
            self.objectWillChange.send()
        }
    }
    
    var objectWillChange = PassthroughSubject<Void, Never>()

    var buildings: [Building] = [] {
        willSet {
            self.objectWillChange.send()
        }
    }
    
    private func fetchAll(buildingId: Int) {
        WebService().getABuilding(buildingId: buildingId){
            self.rooms = $0.rooms!
            self.events = $0.events!
            self.name = $0.name
        }
    }
    let didChange = PassthroughSubject<RoomListViewModel,Never>()
    
}
