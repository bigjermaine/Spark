//
//  ProfileView.swift
//  Spark
//
//  Created by Apple on 13/06/2023.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("onboarding") var isonBoardingViewActive:Bool = false
    @AppStorage("username") var userName = ""
    @AppStorage("email") var eMailAdress = ""
    @AppStorage("firstname") var firstName = ""
    @AppStorage("telephone") var telephone = ""
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    @State private var alertTitle1: String = ""
    @State private var alertMessage1: String = ""
    @State private var showAlertView: Bool = false
    @State private var showAlertView2: Bool = false
    @State private var  signoutToggle = false
    @State private var newUserName = ""
    @State private var newFirstName = ""
    @State private var newEMail = ""
    @State private var newtelephone  = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Update user information:").font(.title2)
                HStack {
                TextField("Username", text: $newUserName).textFieldStyle(.roundedBorder)
                Button("Save") {
                if newUserName.isEmpty == false {
                userName = newUserName
                newUserName = ""
                    alertTitle1 = " Saved Username"
                    showAlertView2.toggle()
                        }
                    }.buttonStyle(.bordered)
                }
                HStack {
                    TextField("Email", text: $newEMail).textFieldStyle(.roundedBorder)
                    Button("Save") {
                        if newEMail.isEmpty == false {
                            eMailAdress = newEMail
                            newEMail = ""
                            alertTitle1 = "Saved Email"
                            showAlertView2.toggle()
                            
                        }
                    }.buttonStyle(.bordered)
                }
                HStack {
                    TextField("FirstName", text: $newFirstName).textFieldStyle(.roundedBorder).textInputAutocapitalization(.never)
                    Button("Save") {
                        if  newFirstName.isEmpty == false {
                            firstName =  newFirstName
                            newFirstName = ""
                            alertTitle1 = "Saved FirstName"
                            showAlertView2.toggle()
                        }
                    }.buttonStyle(.bordered)
                }
                HStack {
                    TextField("telephone", text: $newtelephone ).textFieldStyle(.roundedBorder).textInputAutocapitalization(.never)
                    Button("Save") {
                        if newtelephone.isEmpty == false {
                            telephone  =   newtelephone
                            newtelephone = ""
                            alertTitle1 = "Saved telephone"
                            showAlertView2.toggle()
                        }
                    }.buttonStyle(.bordered)
                }
            }
            .alert(isPresented: $showAlertView2) {
                Alert(title: Text(alertTitle1),message:Text (alertMessage1), dismissButton: .default(Text("Ok")))
            }
            
            .navigationBarTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAlertView = true
                        alertTitle = "SignOut"
                    }) {
                        Text("SignOut")
                            .fontWeight(.heavy)
                            .bold()
                    }
                }
            }
        }
        .alert(isPresented: $showAlertView) {
            Alert(
                title: Text(alertTitle),
                message: Text(alertMessage),
                primaryButton: .cancel(),
                secondaryButton: .destructive(Text("Sign Out")) {
                    UserDefaults.standard.set(nil, forKey: "email")
                    UserDefaults.standard.set(nil, forKey: "username")
                    UserDefaults.standard.set(nil, forKey: "firstname")
                    UserDefaults.standard.set(nil, forKey: "telephone")
                    
                    signoutToggle = true
                    isonBoardingViewActive = true
                }
            )
            
        }
        
        .fullScreenCover(isPresented: $signoutToggle, content: {
            SignUpView()})
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
