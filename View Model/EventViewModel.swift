//
//  EventViewModel.swift
//  monitoring
//
//  Created by Aymeric Vanderkelen on 30/12/2019.
//  Copyright © 2019 Aymeric Vanderkelen. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

final class EventViewModel : ObservableObject {
    
    init(eventId: Int){
        fetch(eventId: eventId)
    }
    
    var event = Event(){
        didSet {
            didChange.send(self)
        }
    }
    
    private func fetch(eventId :Int) {
        WebService().getAnEvent(eventId: eventId){
            self.event = $0
        }
    }
    let didChange = PassthroughSubject<EventViewModel,Never>()
    
}
