//
//  WelcomeScreen.swift
//  Spark
//
//  Created by Apple on 13/06/2023.
//

import SwiftUI


import SwiftUI

struct WelcomeScreen: View {
    @State var signupToggle:Bool = false
    var body: some View {
            //Set Up View
        ZStack {
            Color.white
                .ignoresSafeArea()
           
            VStack(spacing: 100){
                HStack{
                   Text("Ready To Spark")
                  .font(.system(size: 30))
                  .foregroundStyle(
                    LinearGradient(colors: [.pink,.purple,.blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                  )
                 
                    
                 }
              Image("Spark")
                    .resizable()
                    .aspectRatio(contentMode:.fit)
                    .frame(width: 300,height: 300)
                    .border(.white, width: 2)
                  Button("lightening up") {
                      signupToggle = true
                }
              .modifier(ButtonModifier())
            
            }
            
            }
        .frame(maxWidth:.infinity,maxHeight:.infinity)
            .fullScreenCover(isPresented: $signupToggle, content: {
                SignUpView()
                 
           })
       }
        
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
