//
//  ContentView.swift
//  Image Parallax
//
//  Created by Adriano Rezena on 28/02/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("img_gradient")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
