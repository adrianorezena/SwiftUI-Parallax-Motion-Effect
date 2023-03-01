//
//  MotionManager.swift
//  Image Parallax
//
//  Created by Adriano Rezena on 28/02/23.
//

import SwiftUI
import CoreMotion

final class MotionManager: ObservableObject {
    
    @Published var cmMotionManager = CMMotionManager()
    @Published var x: CGFloat = 0
    @Published var y: CGFloat = 0
    
    func start(padding: CGFloat) {
        cmMotionManager.startDeviceMotionUpdates(to: .main) { data, error in
            guard let data = data else {
                return
            }

            print("x: \(data.attitude.roll) | y: \(data.attitude.pitch)")
            
            // let maxPadding: CGFloat = 1.5
            
            withAnimation {
                self.x = data.attitude.roll
                self.y = data.attitude.pitch
            }
        }
    }
    
    func stop() {
        cmMotionManager.stopDeviceMotionUpdates()
    }
    
}
