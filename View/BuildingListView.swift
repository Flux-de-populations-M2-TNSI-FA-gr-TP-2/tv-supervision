//
//  BuildingListView.swift
//  monitoring
//
//  Created by Aymeric Vanderkelen on 16/12/2019.
//  Copyright © 2019 Aymeric Vanderkelen. All rights reserved.
//

import SwiftUI

struct BuildingListView: View {
    
    @ObservedObject var model = BuildingListViewModel()
    let colors: [Color] = [.red, .green, .blue]
    var body: some View {
        NavigationView {
            ScrollView(.horizontal, showsIndicators: true) {
                HStack{
                    ForEach(self.model.buildings, id: \.id){ building in
                            BuildingBoxView(building: building)
                        }
                }.frame(height:250).padding(.horizontal, 120)
            }.navigationBarTitle(Text("OMENI - Monitoring Université Polytechnique des Hauts de France"))
                .background(NavigationConfigurator { nc in
                    nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
                })
            
        }.navigationViewStyle(StackNavigationViewStyle()).background(Image("background-apple-tv").resizable().scaledToFill()).edgesIgnoringSafeArea(.all)
    }
    
    
}

struct BuildingBoxView : View {
    let building: Building
    
    @State var isModal: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            VStack(){
                Button(action: {
                    print("button pressed : \(self.building.id)")
                    self.isModal = true
                }) {
                    Image("mont-houy").resizable().frame(width: 160, height:90)
                }.sheet(isPresented: self.$isModal, content: {
                    RoomListView(roomModel: RoomListViewModel(buildingId: self.building.id))
                }).background(Color.clear)
                Text(building.name).font(.headline).foregroundColor(.white)
                Text(building.address).font(.subheadline).foregroundColor(.white)
            }.background(Color.clear)
            Spacer()
        }.frame(width: 300)
    }
    
    
}

struct BuildingListView_Previews: PreviewProvider {
    static var previews: some View {
        BuildingListView()
    }
}
