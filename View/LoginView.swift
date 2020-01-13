//
//  LoginView.swift
//  monitoring
//
//  Created by Aymeric Vanderkelen on 11/12/2019.
//  Copyright © 2019 Aymeric Vanderkelen. All rights reserved.
//

import Foundation

import SwiftUI


struct LoginView:View {
    
    @State var username: String = ""
    @State var password: String = ""
    @State var message: String = ""
    @State var isModal: Bool = false
    var keyChainService = KeyChainService();
    
    var body: some View {
        VStack{
            Text("Connexion à OMENI - Monitoring").font(.title).foregroundColor(Color.white)
            HStack(spacing : 500) {
                Spacer()
                TextField("Email ou identifiant", text: $username).background(Color.white)
                Spacer()
            }
            HStack(spacing: 500) {
                Spacer()
                SecureField("Mot de passe", text: $password).background(Color.white)
                Spacer()
            }
            Text("\(self.message)").foregroundColor(Color.red)
            Button("Connexion"){
                WebService().postLogin(email: self.username,password: self.password) {
                    self.isModal = $0
                    if !self.isModal {
                        self.message = "Email ou mot de passe incorrect"
                    }
                }
                
            }.sheet(isPresented: $isModal, content: {
                ContentView()
            }
            ).foregroundColor(Color.white).background(Color.black)
            }.background(Image("background-apple-tv").resizable().scaledToFill()).edgesIgnoringSafeArea(.all)
    }
}
