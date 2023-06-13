//
//  BrowseView.swift
//  Spark
//
//  Created by Apple on 13/06/2023.
//

import SwiftUI

struct BrowseView: View {
   
    @AppStorage("onboarding") var isonBoardingViewActive:Bool = false
    @EnvironmentObject var   UserCoredataViewModel: UserCoredataViewModel
    @AppStorage("username") var userName = "Username"
    @AppStorage("email") var eMailAdress = ""
    @AppStorage("firstname") var firstName = ""
    @AppStorage("telephone") var telephone = ""
    var user:User?
    var body: some View {
        
    NavigationView{
            ZStack {
             
                VStack{
                    Spacer()
                    HStack{
                        Text("Ready To Spark")
                            .font(.system(size: 30))
                            .foregroundStyle(
                            LinearGradient(colors: [.pink,.purple,.blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                    }
                     Spacer()
                    List{
                        HStack{
                            Text("username:")
                            Spacer()
                            if userName == "" {
                                Text(UserCoredataViewModel.user?.userName ?? "")
    
                            }else {
    
                                Text("\(userName)")
                                    .frame(maxWidth:200, alignment: .leading)
                            }
                        }
                        HStack{
                            Text("email address: ")
                            Spacer()
    
                            if eMailAdress == "" {
                                Text(UserCoredataViewModel.user?.email ?? "")
    
                            }else {
    
                                Text("\(eMailAdress)")
                                    .frame(maxWidth:200, alignment: .leading)
    
                            }
    
    
                        }
                        HStack{
                            Text("firstname:")
                            Spacer()
    
                            if firstName == "" {
                                Text(UserCoredataViewModel.user?.name ?? "")
    
                            }else {
                                Text("\(firstName)")
                                    .frame(maxWidth:200, alignment: .leading)
                            }
    
                        }
    
                        HStack{
                            Text("telephone:")
                            Spacer()
    
                            if telephone == "" {
                                Text(UserCoredataViewModel.user?.phoneNumber  ?? "")
                            }else {
    
                                Text("\(telephone)")
                                    .frame(maxWidth:200, alignment: .leading)
                            }
    
                        }
                    }
    
                        Spacer()
                }
    
                  
            }
                .onAppear{
                 
                    isonBoardingViewActive = false
                    DispatchQueue.main.async {
                        UserCoredataViewModel.retrieveUserDetails(email:userName )
                    }
                    
            }
        }
    }
    
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
            .environmentObject( UserCoredataViewModel())
    }
}
