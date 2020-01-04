//
//  EventListView.swift
//  monitoring
//
//  Created by Aymeric Vanderkelen on 30/12/2019.
//  Copyright © 2019 Aymeric Vanderkelen. All rights reserved.
//

import SwiftUI

struct EventListView: View {
    
    @ObservedObject var eventModel : EventListViewModel = EventListViewModel()
    
    var body: some View {
        NavigationView {
            VStack() {
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack{
                        ForEach(eventModel.events, id: \.id){ event in
                            EventBoxView(event: event)
                        }
                    }.padding(.horizontal, 150).frame(height:220)
                }
            }.navigationBarTitle(Text("OMENI - Liste des évènements"))
                .background(NavigationConfigurator { nc in
                    nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
                })
        }.navigationViewStyle(StackNavigationViewStyle()).background(Image("background-apple-tv").resizable().scaledToFill()).edgesIgnoringSafeArea(.all)
    }
}



struct EventListView_Previews: PreviewProvider {
    static var previews: some View {
        EventListView()
    }
}
