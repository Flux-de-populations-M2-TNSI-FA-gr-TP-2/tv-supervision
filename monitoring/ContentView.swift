//
//  ContentView.swift
//  monitoring
//
//  Created by Aymeric Vanderkelen on 10/12/2019.
//  Copyright © 2019 Aymeric Vanderkelen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Button(action: {
                print("hello world");
            }){
            Text("Batiments")
                .foregroundColor(.white)
                .font(.subheadline)
                .background(Color.red)
            }
            
            Button(action: {
                print("Hello world 2");
            }){
                Text("Évènements").foregroundColor(.white).font(.subheadline).background(Color.red)
            }
            
            Button(action: {
                print("hello word 3")
            }){
                Text("Informations générales").foregroundColor(.white).background(Color.red)
            }
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
