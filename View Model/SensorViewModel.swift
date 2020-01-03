//
//  SensorViewModel.swift
//  monitoring
//
//  Created by Aymeric Vanderkelen on 02/01/2020.
//  Copyright © 2020 Aymeric Vanderkelen. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

final class SensorViewModel : ObservableObject {
    
    init(sensorId: Int){
        fetch(_sensorId: sensorId)
    }
    
    var sensor = Sensor(){
        willSet {
            self.objectWillChange.send()
        }
    }
    
    var objectWillChange = PassthroughSubject<Void, Never>()
    
    private func fetch(_sensorId :Int) {
        WebService().getASensor(sensorId: _sensorId){
            self.sensor = $0
            print(self.sensor)
        }
    }
    
}

