//
//  SensorView.swift
//  monitoring
//
//  Created by Aymeric Vanderkelen on 14/12/2019.
//  Copyright © 2019 Aymeric Vanderkelen. All rights reserved.
//

import SwiftUI

struct SensorView: View {
    
    @ObservedObject var sensor : SensorViewModel
    
    var body: some View {
        NavigationView {
            HStack(spacing:150) {
                if(sensor.sensor.types != nil){
                    ForEach(sensor.sensor.types!){
                        type in
                        if(type.name == "TemperatureSensor"){
                            VStack(spacing:10){
                                Text("Température").foregroundColor(Color.white)
                                HStack(spacing: 5) {
                                    Text("\(self.sensor.sensor.infos?.temperature ?? "pas dispo") \(type.unity ?? "°C")").font(.system(size: 40)).foregroundColor(Color.white)
                                    Image("temperature").resizable().frame(width:100, height:100, alignment: .leading)
                                }
                            }
                        }
                        if(type.name == "MotionSensor"){
                            VStack(spacing:10){
                                Text("Mouvement en cours").foregroundColor(Color.white)
                                HStack(spacing: 5) {
                                    if(self.sensor.sensor.infos?.motion == false){
                                        Text("Aucun").font(.system(size: 60)).foregroundColor(Color.white)
                                    }
                                    else {
                                        Text("Mouvement détecté").font(.system(size: 60)).foregroundColor(Color.white)
                                    }
                                }
                            }
                        }
                    }
                    if(self.sensor.sensor.infos?.luminance != nil){
                        VStack(spacing:10){
                            Text("Niveau de lumière").foregroundColor(Color.white)
                            HStack(spacing: 5) {
                                if(Int(self.sensor.sensor.infos?.luminance ?? "0") ?? 0 <= 500){
                                    Text("Faible").font(.system(size: 60)).foregroundColor(Color.white)
                                }
                                else if(Int(self.sensor.sensor.infos?.luminance ?? "0") ?? 0 <= 3000){
                                    Text("Moyen").font(.system(size: 60)).foregroundColor(Color.white)
                                }
                                else {
                                    Text("Élevé").font(.system(size: 60)).foregroundColor(Color.white)
                                }
                            }
                        }
                    }
                }
                if(self.sensor.sensor.infos?.wakeUpInterval == nil){
                    Text("Aucune donnée provenant des capteurs ne peut être affichée.").font(.system(size: 60)).foregroundColor(Color.white)
                }
                
            }.navigationBarTitle(Text("Capteur \"\(self.sensor.sensor.name ?? "???")\""))
                    .background(NavigationConfigurator { nc in
                        nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
                    })
            }.navigationViewStyle(StackNavigationViewStyle()).background(Image("background-apple-tv").resizable().scaledToFill()).edgesIgnoringSafeArea(.all)
        
    }
}

struct SensorView_Previews: PreviewProvider {
    static var previews: some View {
        SensorView(sensor: SensorViewModel(sensorId: 2))
    }
}
