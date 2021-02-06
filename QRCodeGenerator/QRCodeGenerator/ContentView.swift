//
//  ContentView.swift
//  QRCodeGenerator
//
//  Created by Xiaowei on 12/9/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
        Text("Hello there!")
            QRCodeView(url: "https://www.northeastern.edu")
        }
           
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
