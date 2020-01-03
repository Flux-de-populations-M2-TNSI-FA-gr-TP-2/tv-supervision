//
//  EventView.swift
//  monitoring
//
//  Created by Aymeric Vanderkelen on 30/12/2019.
//  Copyright © 2019 Aymeric Vanderkelen. All rights reserved.
//

import SwiftUI

struct EventView: View {
    
    
    @State var eventModel : EventViewModel
    
    var body: some View {
        NavigationView {
            VStack() {
                Text("debut le : \(MainService.formatDate(date: eventModel.event.start))").foregroundColor(Color.white)
                Text("Fin le \(MainService.formatDate(date: eventModel.event.end))").foregroundColor(Color.white)
                Text("Statut de l'évènement : \(eventModel.event.status)").foregroundColor(Color.white)
                if(eventModel.event.event_groups != nil) {
                    Text("Groupe destinataire : ").foregroundColor(Color.white)
                    ForEach(eventModel.event.event_groups!, id: \.id){
                        group in
                        Text("- \(group.name)").foregroundColor(Color.white)
                    }
                }
            }.navigationBarTitle(Text("Détails de l'évènement \"\(eventModel.event.name)\"").foregroundColor(Color.white))
                .background(NavigationConfigurator { nc in
                    nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
                })
        }.navigationViewStyle(StackNavigationViewStyle()).background(Image("background-apple-tv").resizable().scaledToFill()).edgesIgnoringSafeArea(.all)
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(eventModel: EventViewModel(eventId: 2))
    }
}
