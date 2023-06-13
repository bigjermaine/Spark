//
//  SignIn.swift
//  Spark
//
//  Created by Apple on 13/06/2023.
//

import SwiftUI


struct SignInView: View {
    @AppStorage("onboarding") var isonBoardingViewActive:Bool = false
    @State var username:String = ""
    @State private var showAlertView: Bool = false
    @State var password:String = ""
    @State var email:String = ""
    @State var signupToggle:Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                VStack(spacing:40) {
                    HStack{
                        Text("Sign In")
                        .font(.system(size: 50))
                        .foregroundStyle(
                        LinearGradient(colors: [.pink,.purple,.blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                    }
                    Spacer()
                    VStack(spacing:40) {
                        HStack{
                            Image(systemName: "person.badge.key")
                            TextField("Username", text:$username)
                        }
                        .foregroundColor(.white)
                        .modifier(TextFieldModifier())
                        
                        HStack{
                            Image(systemName: "key")
                            TextField("Password", text:$password)
                        }
                        .foregroundColor(.white)
                        .modifier(TextFieldModifier())
                        Button("Sign in") {
                            self.signin()
                        }
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                        .frame(width: 150,height: 50)
                        .background(Color.purple)
                        .cornerRadius(8)
                        
                    }
                    Spacer()
                    
                }
                
                
            }
           
            .alert(isPresented: $showAlertView) {
                Alert(title: Text(alertTitle),message:Text (alertMessage), dismissButton: .cancel())
            }
            .fullScreenCover(isPresented: $signupToggle, content: {
                
                TabBar()
                
            })
            
            
        }
    }
    
    
    func signin() {
        
        if  password.count  >= 3 && username.count >= 3  {
            HapticManager.shared.vibrate(for: .success)
          
            print("User signed up!")
            
            signupToggle = true
            UserDefaults.standard.set(email, forKey: "email")
            UserDefaults.standard.set(username, forKey: "username")
            username = ""
            email = ""
            password = ""
        }else if  password.count  <= 2  {
            
            
            HapticManager.shared.vibrate(for: .error)
            self.alertTitle = "Uh-oh!"
            self.alertMessage = ("PassWord  Does Not Match /PassWord is not equal to or greater than 6")
            self.showAlertView.toggle()
        }else if username.count < 3 {
            HapticManager.shared.vibrate(for: .error)
            self.alertTitle = "Uh-oh!"
            self.alertMessage = ("Username Is Short")
            self.showAlertView.toggle()
            
        }else {
            HapticManager.shared.vibrate(for: .error)
            self.alertTitle = "Uh-oh!"
            self.alertMessage = ("Fill Your Details Properly")
            self.showAlertView.toggle()
        }
    }
    
}


struct SignupScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
