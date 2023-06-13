//
//  TabBar.swift
//  Spark
//
//  Created by Apple on 13/06/2023.
//

import SwiftUI

struct TabBar: View {
    @StateObject var usercoredataviewModel  =  UserCoredataViewModel()
    var body: some View {
        TabView{
           BrowseView()
                .environmentObject(usercoredataviewModel)
                .tabItem {
                    Image(systemName: "house")
                    Text("Browse")
                }
          
           ProfileView()
             .tabItem {
                 Image(systemName: "gear")
                 Text("Settings")
             }
            
        }
        .accentColor(.purple)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
