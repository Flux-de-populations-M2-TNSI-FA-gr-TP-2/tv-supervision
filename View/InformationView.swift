//
//  InformationView.swift
//  monitoring
//
//  Created by Aymeric Vanderkelen on 04/01/2020.
//  Copyright © 2020 Aymeric Vanderkelen. All rights reserved.
//

import SwiftUI

struct InformationView: View {
    
    @ObservedObject var informationModel : InformationViewModel = InformationViewModel()
    
    var body: some View {
        NavigationView{
            VStack(){
                if(informationModel.informations.rooms == -1){
                    Text("Les informations sont en cours de chargement...").foregroundColor(Color.white)
                } else {
                    Text("Nombre d'utilisateurs : \(informationModel.informations.users)").foregroundColor(Color.white)
                    Text("Nombre de groupes évènements:  \(informationModel.informations.event_groups)").foregroundColor(Color.white)
                    Text("Nombre d'évènements : \(informationModel.informations.events)").foregroundColor(Color.white)
                    Text("Nombre de batiments:  \(informationModel.informations.locations)").foregroundColor(Color.white)
                    Text("Nombre de capteurs : \(informationModel.informations.sensors)").foregroundColor(Color.white)
                    Text("Nombre de type de capteurs : \(informationModel.informations.sensor_types)").foregroundColor(Color.white)
                }
            }.navigationBarTitle(Text("Informations OMENI"))
                .background(NavigationConfigurator { nc in
                    nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
                })
        }.navigationViewStyle(StackNavigationViewStyle()).background(Image("background-apple-tv").resizable().scaledToFill()).edgesIgnoringSafeArea(.all)
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}
