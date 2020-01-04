//
//  RoomListView.swift
//  monitoring
//
//  Created by Aymeric Vanderkelen on 18/12/2019.
//  Copyright © 2019 Aymeric Vanderkelen. All rights reserved.
//

import SwiftUI

struct RoomListView: View {
    
    @ObservedObject var roomModel : RoomListViewModel
    
    var body: some View {
        NavigationView {
            VStack(){
                Text("Listes des salles").font(.title).foregroundColor(Color.white)
                if(!self.roomModel.rooms.isEmpty){
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack{
                        ForEach(roomModel.rooms, id: \.id){ room in
                            RoomBoxView(room: room)
                        }
                    }.padding(.horizontal, 150).frame(height:220)
                    }
                }
                else {
                    Text("Aucune salle pour ce batiment").font(.subheadline).foregroundColor(Color.white)
                }
                Text("Listes des évènements").font(.title).foregroundColor(Color.white)
                if(!self.roomModel.events.isEmpty){
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack{
                            ForEach(roomModel.events, id: \.id){ event in
                                EventBoxView(event: event)
                            }
                            }.frame(height:220).padding(.horizontal, 150)
                    }
                } else {
                    Text("Aucun évènement pour ce batiment").font(.subheadline).foregroundColor(Color.white)
                }
            }.navigationBarTitle(Text("OMENI - Détails du batiment " + roomModel.name))
            .background(NavigationConfigurator { nc in
                nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
            })
        }.navigationViewStyle(StackNavigationViewStyle()).background(Image("background-apple-tv").resizable().scaledToFill()).edgesIgnoringSafeArea(.all)
    }
}

struct RoomBoxView : View {
    let room: Room
    
    @State var isModal: Bool = false
    
    var body: some View {
        VStack{
            Button(action: {
                self.isModal = true
            }) {
                Image("mont-houy").resizable().frame(width: 200, height:90)
            }.sheet(isPresented: self.$isModal, content: {
                SensorListView(sensorModel: SensorListViewModel(roomId: self.room.id))
            })
            Text(room.name).foregroundColor(Color.white)
            Text("Étage : \(room.floor)").foregroundColor(Color.white)
        }
    }
}

struct EventBoxView : View {
    let event: Event
    
    @State var isModal: Bool = false
    
    var body: some View {
        VStack{
            Button(action: {
                self.isModal = true
            }) {
                Image("event").resizable().frame(width: 200, height: 90)
            }.sheet(isPresented: self.$isModal, content: {
                EventView(eventModel: EventViewModel(eventId: self.event.id))
            })
            Text(event.name).foregroundColor(Color.white)
            Text("Statut : \(event.status)").foregroundColor(Color.white)
        }.padding(.horizontal, 10)
    }
    
    func formatDate(date: Date) -> String {
        let french = DateFormatter()
        french.dateStyle = .medium
        french.timeStyle = .medium
        french.locale    = Locale(identifier: "FR-fr")
        return french.string(from: date)
    }
}

struct RoomListView_Previews: PreviewProvider {
    static var previews: some View {
        RoomListView(roomModel: RoomListViewModel(buildingId: 2))
    }
}

