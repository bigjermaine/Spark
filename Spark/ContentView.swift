//
//  ContentView.swift
//  Spark
//
//  Created by Apple on 13/06/2023.
//

import SwiftUI


struct ContentView: View {
    @AppStorage("onboarding") var isonBoardingViewActive:Bool = false
    var body: some View {
        ZStack {
           
            if isonBoardingViewActive {
                WelcomeScreen()
            }else{
                TabBar()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

