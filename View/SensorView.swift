//
//  SensorView.swift
//  monitoring
//
//  Created by Aymeric Vanderkelen on 14/12/2019.
//  Copyright © 2019 Aymeric Vanderkelen. All rights reserved.
//

import SwiftUI

struct SensorView: View {
    var body: some View {
        HStack(spacing:150) {
            VStack(spacing: 10){
                Text("Taux d'humidité")
                HStack(spacing: 5) {
                    Text("15").font(.system(size: 60))
                Image("humidity").resizable().frame(width: 100, height: 100,alignment: .leading)
                }
            }.padding().border(Color.black, width: 2)
            VStack(spacing:10){
                Text("Température")
                HStack(spacing: 5) {
                    Text("23 °C").font(.system(size: 60))
                    Image("temperature").resizable().frame(width:100, height:100, alignment: .leading)
                }
            }
            VStack(spacing: 10){
                Text("Fréquentation")
                HStack(spacing: 5) {
                    Text("Haute").font(.system(size: 60))
                    Image("people").resizable().frame(width: 100, height: 100, alignment: .leading)
                }
            }
        }

    }
}

struct SensorView_Previews: PreviewProvider {
    static var previews: some View {
        SensorView()
    }
}
