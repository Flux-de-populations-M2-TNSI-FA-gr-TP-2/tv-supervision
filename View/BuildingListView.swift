//
//  BuildingListView.swift
//  monitoring
//
//  Created by Aymeric Vanderkelen on 16/12/2019.
//  Copyright © 2019 Aymeric Vanderkelen. All rights reserved.
//

import SwiftUI

struct BuildingListView: View {
    
    @State var model = BuildingListViewModel()
    
    init(){
        WebService().getAllBuildings {
            print($0)
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.horizontal, showsIndicators: true) {
                HStack{
                    ForEach(model.buildings,id: \.id){ building in
                         BuildingBoxView(building: building)
                    }
                }
            }
        }.padding(20).navigationBarTitle("Liste des batiments")
    }
    
   
}

struct BuildingBoxView : View {
    let building: Building
    
    @State var isModal: Bool = false
    
    var body: some View {
        VStack {
            Button(action: {
              print("button pressed")
                self.isModal = true
            }) {
                Image("mont-houy").resizable().frame(width: 200, height:90)
            }.sheet(isPresented: self.$isModal, content: {
                SensorView()
            })
            
            Text(building.name)
            Text(building.address)
        }
    }
    
    
}

struct BuildingListView_Previews: PreviewProvider {
    static var previews: some View {
        BuildingListView()
    }
}
