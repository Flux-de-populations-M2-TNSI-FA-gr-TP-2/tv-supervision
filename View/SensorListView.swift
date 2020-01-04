//
//  SensorListView.swift
//  monitoring
//
//  Created by Aymeric Vanderkelen on 02/01/2020.
//  Copyright © 2020 Aymeric Vanderkelen. All rights reserved.
//

import SwiftUI

struct SensorListView: View {
    
    @ObservedObject var sensorModel : SensorListViewModel
    
    var body: some View {
        NavigationView {
            VStack(){
                if(!self.sensorModel.sensors.isEmpty){
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack{
                            ForEach(sensorModel.sensors, id: \.id){ sensor in
                                SensorBoxView(sensor: sensor)
                            }
                        }
                    }.padding(.horizontal, 150).frame(height:220)
                }else {
                    Text("Aucun capteur disponible pour cette salle.").font(.subheadline).foregroundColor(Color.white)
                }
            }.navigationBarTitle(Text("OMENI - Liste des capteurs"))
                .background(NavigationConfigurator { nc in
                    nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
                })
        }.navigationViewStyle(StackNavigationViewStyle()).background(Image("background-apple-tv").resizable().scaledToFill()).edgesIgnoringSafeArea(.all)
    }
}

struct SensorBoxView : View {
    let sensor: Sensor
    
    @State var isModal: Bool = false
    
    var body: some View {
        VStack(){
            Button(action: {
                self.isModal = true
            }) {
                Image("mont-houy").resizable().frame(width: 200, height: 90)
            }.sheet(isPresented: self.$isModal, content: {
                SensorView(sensor: SensorViewModel(sensorId: self.sensor.id))
            })
            Text("capteur \(sensor.name!)").foregroundColor(Color.white)
            Text("Type : \(sensor.type ?? "non renseigné" )").foregroundColor(Color.white)
        }
    }
}


struct SensorListView_Previews: PreviewProvider {
    static var previews: some View {
        SensorListView(sensorModel: SensorListViewModel(roomId: 1))
    }
}
