//
//  SignUpView.swift
//  Spark
//
//  Created by Apple on 13/06/2023.
//

import SwiftUI


struct SignUpView: View {
    @AppStorage("onboarding") var isonBoardingViewActive:Bool = true
    @StateObject var usercoredataviewModel  =      UserCoredataViewModel()
    @State var firstname:String = ""
    @State var telephone:String = ""
    @State var username:String = ""
    @State var password:String = ""
    @State var password2:String = ""
    @State var email:String = ""
    @State private var showAlertView: Bool = false
    @State private var signupToggle: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                VStack(spacing:40) {
                    HStack{
                        Text("Sign Up")
                            .font(.system(size: 50))
                            .foregroundStyle(
                                LinearGradient(colors: [.pink,.purple,.blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                    }
                    Spacer()
                    VStack(spacing:40) {
                        
                        HStack{
                            Image(systemName: "person")
                            TextField("FirstName", text:$firstname)
                            
                        }
                        .foregroundColor(.white)
                        .modifier(TextFieldModifier())
                        
                        HStack{
                            Image(systemName: "person.badge.key")
                            TextField("Username", text:$username)
                            
                        }
                        .foregroundColor(.white)
                        .modifier(TextFieldModifier())
                        
                        HStack{
                            Image(systemName: "mail")
                            TextField("Email", text:$email)
                            
                        }
                        .foregroundColor(.white)
                        .modifier(TextFieldModifier())
                        
                        
                        HStack{
                            Image(systemName: "phone.fill")
                            TextField("PhoneNumber", text:$telephone) .keyboardType(.numberPad)
                            
                        }
                        .foregroundColor(.white)
                        .modifier(TextFieldModifier())
                        .foregroundColor(.white)
                        HStack{
                            Image(systemName: "key")
                            TextField("Password", text:$password)
                            
                        }
                        .foregroundColor(.white)
                        .modifier(TextFieldModifier())
                        
                        
                        HStack{
                            Image(systemName: "key")
                            TextField("Confirm Password", text:$password2)
                            
                        }
                        .foregroundColor(.white)
                        .modifier(TextFieldModifier())
                        
                        Button("Sign up") {
                            self.signup()
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
            .toolbar {
                ToolbarItem(placement:.automatic) {
                    NavigationLink("SignIn", destination: SignInView()).fontWeight(.heavy)
                        .bold()
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
    func signup() {
        guard let checkTelephone = Int(telephone) else {return}
        
        if password == password2 &&  password.count  >= 6 && username.count >= 3 && firstname.count >= 3 && checkTelephone >= 11 && email.contains("@") {
            HapticManager.shared.vibrate(for: .success)
            isonBoardingViewActive = false
            print("User signed up!")
            signupToggle = true
            UserDefaults.standard.set(email, forKey: "email")
            UserDefaults.standard.set(username, forKey: "username")
            UserDefaults.standard.set(firstname, forKey: "firstname")
            UserDefaults.standard.set(telephone, forKey: "telephone")
            usercoredataviewModel.addBooking(Name: firstname, phonenumber: telephone, username: username, email: email)
            username = ""
            email = ""
            telephone = ""
            firstname = ""
            password = ""
            password2 = ""
        }else if  password != password2  &&  password.count  >= 6  {
            
            
            HapticManager.shared.vibrate(for: .error)
            self.alertTitle = "Uh-oh!"
            self.alertMessage = ("PassWord  Does Not Match /PassWord is not equal to or greater than 6")
            self.showAlertView.toggle()
        }else if username.count < 3 {
            HapticManager.shared.vibrate(for: .error)
            self.alertTitle = "Uh-oh!"
            self.alertMessage = ("Username Is Short")
            self.showAlertView.toggle()
        }else if firstname.count < 3 {
            HapticManager.shared.vibrate(for: .error)
            self.alertTitle = "Uh-oh!"
            self.alertMessage = ("firstname Is Short")
            self.showAlertView.toggle()
        }else if checkTelephone < 6 {
            HapticManager.shared.vibrate(for: .error)
            self.alertTitle = "Uh-oh!"
            self.alertMessage = ("Phone Number Is short")
            self.showAlertView.toggle()
        }else {
            HapticManager.shared.vibrate(for: .error)
            self.alertTitle = "Uh-oh!"
            self.alertMessage = ("Fill Your Details Properly")
            self.showAlertView.toggle()
        }
    }
    
    enum error {
        case password
        case username
        case email
        case firtname
        case telephone
    }
}
             
    


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
