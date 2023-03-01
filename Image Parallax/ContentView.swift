//
//  ContentView.swift
//  Image Parallax
//
//  Created by Adriano Rezena on 28/02/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var motionManager = MotionManager()
    let imagePadding: CGFloat = 40
    
    var body: some View {
        ZStack {
            Image("img_gradient")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .padding(-imagePadding)
//                .offset(x: motionManager.x, y: motionManager.y)
        }
        .onAppear {
            motionManager.start(padding: imagePadding)
        }
        .onDisappear {
            motionManager.stop()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
