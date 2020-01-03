//
//  ContentView.swift
//  monitoring
//
//  Created by Aymeric Vanderkelen on 10/12/2019.
//  Copyright © 2019 Aymeric Vanderkelen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var presentBuilding: Bool = false
    @State var presentEvents: Bool = false
    @State var logoutButton: Bool = false
    var body: some View {
        NavigationView {
            VStack(spacing: 300){
                HStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Button("Déconnexion"){
                        self.logoutButton = true
                    }.sheet(isPresented: $logoutButton, content: {
                        LoginView()
                    }).background(Color.black).foregroundColor(Color.white)
                    
                    Spacer()
                    
                }
                HStack(spacing:150){
                    Button("Batiments") {
                        self.presentBuilding = true
                    }.sheet(isPresented: $presentBuilding, content: {
                        BuildingListView()
                    }).foregroundColor(.white).background(Color.black)
                    Button("Évènements") {
                        self.presentEvents = true
                    }.sheet(isPresented: $presentEvents, content: {
                        EventListView()
                    }).foregroundColor(.white).background(Color.black)
                    Button("Informations") {
                        self.presentBuilding = true
                    }.sheet(isPresented: $presentBuilding, content: {
                        BuildingListView()
                    }).foregroundColor(.white).background(Color.black)
                }
                Spacer()
            }.navigationBarTitle(Text("Monitoring Université Polytechnique des Hauts de France"))
                .background(NavigationConfigurator { nc in
                    nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
                })
        }.navigationViewStyle(StackNavigationViewStyle()).background(Image("background-apple-tv").resizable().scaledToFill()).edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
