//
//  ContentView.swift
//  Image Parallax
//
//  Created by Adriano Rezena on 28/02/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var motionManager = MotionManager()
    let imagePadding: CGFloat = 60
    
    var body: some View {
        ZStack {
            Image("img_gradient")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .padding(-imagePadding)
                 .offset(x: motionManager.offset.width, y: motionManager.offset.height)
            
            VStack {
                Text("WELCOME")
                    .font(.system(size: 60))
                    .fontWeight(.black)
                    .foregroundColor(.white)
                
                NavigationLink(
                    destination: {
                        Text("Other screen")
                    }, label: {
                        Text("NEXT")
                            .font(.title2)
                            .fontWeight(.black)
                            .foregroundColor(.white)
                            .padding(20)
                            .overlay {
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(lineWidth: 2)
                                    .foregroundColor(.white)
                            }
                    }
                )
            }
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
