//
//  EventListViewModel.swift
//  monitoring
//
//  Created by Aymeric Vanderkelen on 30/12/2019.
//  Copyright © 2019 Aymeric Vanderkelen. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

final class EventListViewModel : ObservableObject {
    
    init(){
        fetchAll()
    }
    
    var events = [Event](){
        willSet {
            self.objectWillChange.send()
        }
    }
    
    var objectWillChange = PassthroughSubject<Void, Never>()
    
    private func fetchAll() {
        WebService().getEvents(){
            self.events = $0
        }
    }
    
}
