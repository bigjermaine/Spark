//
//  Modifiers.swift
//  Spark
//
//  Created by Apple on 13/06/2023.
//

import Foundation
import SwiftUI


struct ButtonModifier:ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 15))
            .foregroundColor(.white)
            .frame(width: 200,height: 50)
            .background(Color.purple)
            .cornerRadius(8)
        
    }
}

struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}


struct TextFieldModifier:ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.leading,20)
            .padding(.vertical,10)
            .foregroundColor(.black)
            .overlay (
                RoundedRectangle(cornerRadius: 25)
                    .stroke(LinearGradient(colors: [.blue,.red,.red], startPoint: .topLeading, endPoint: .bottomTrailing)))
            .mask(
                LinearGradient(colors: [.blue,.red,.red], startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(25)
            .padding(.horizontal,20)
        
    }
}

struct ForegroundModifier:ViewModifier {
    func body(content: Content) -> some View {
        
        content
            .foregroundStyle(
                LinearGradient(colors: [.pink,.purple,.blue], startPoint: .topLeading, endPoint: .bottomTrailing)
            )
    }
}
