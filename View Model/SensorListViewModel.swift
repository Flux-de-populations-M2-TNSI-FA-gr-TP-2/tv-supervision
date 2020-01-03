//
//  SensorListViewModel.swift
//  monitoring
//
//  Created by Aymeric Vanderkelen on 02/01/2020.
//  Copyright © 2020 Aymeric Vanderkelen. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

final class SensorListViewModel : ObservableObject {
    
    init(roomId: Int){
        fetch(_roomId: roomId)
    }
    
    var sensors = [Sensor](){
        willSet {
            self.objectWillChange.send()
        }
    }
    
    var objectWillChange = PassthroughSubject<Void, Never>()
    
    
    
    private func fetch(_roomId :Int) {
        WebService().getSensorsFromRoom(roomId: _roomId){
            self.sensors = $0!
            print("sensors list : \(self.sensors)")
        }
    }
    
}
