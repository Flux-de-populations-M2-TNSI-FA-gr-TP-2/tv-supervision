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
    
    var body: some View {
        NavigationView {
        VStack(spacing: 150){
            HStack {
                Spacer()
                Button(action: {
                print("logout button")
                }){
                Text("Déconnexion")
                }.foregroundColor(Color.white).background(Color.black)
                    .frame(width: 250, height: 200, alignment: .center)
            }
            HStack(spacing:150){
                Button("Batiments") {
                    print("click building")
                    //let array = Building.getBuildingListFromApi()!
                   // print("result call : \(array)")
                    self.presentBuilding = true
                }.sheet(isPresented: $presentBuilding, content: {
                    BuildingListView()
                })
                
                Button(action: {
                    print("Hello world 2");
                }){
                    Text("Évènements").foregroundColor(.white).frame(width: 250)
                }
                
                Button(action: {
                    print("hello word 3")
                }){
                Text("Informations").foregroundColor(.white).frame(width: 250)
                }
            }.navigationBarTitle(Text("Monitoring Université Polytechnique des Hauts de France"))
            Spacer()
    }.background(Image("background-apple-tv").resizable().scaledToFill())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
