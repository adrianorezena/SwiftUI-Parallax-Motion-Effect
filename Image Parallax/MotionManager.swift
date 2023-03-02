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
    @Published var offset: CGSize = .zero
    
    func start(padding: CGFloat) {
        cmMotionManager.startDeviceMotionUpdates(to: OperationQueue()) { data, error in
            guard let data = data else {
                return
            }

            DispatchQueue.main.async {
                withAnimation {
                    let offset = self.calcOffset(x: data.attitude.roll, y: data.attitude.pitch, padding: padding)
                    self.offset = offset
                }
            }
        }
    }
    
    private func calcOffset(x: CGFloat, y: CGFloat, padding: CGFloat) -> CGSize {
        let maxPadding: CGFloat = 1.5
        var newX: CGFloat = x
        var newY: CGFloat = y
        
        if newX < 0 {
            newX = max(-maxPadding, newX)
        } else {
            newX = min(maxPadding, newX)
        }
        
        newX = (newX / maxPadding) * padding
        
        if newY < 0 {
            newY = max(-maxPadding, newY)
        } else {
            newY = min(maxPadding, newY)
        }

        newY = (newY / maxPadding) * padding
      
        debugPrint("x: \(newX) | y: \(newY)")
        return CGSize(width: newX, height: newY)
    }
    
    func stop() {
        cmMotionManager.stopDeviceMotionUpdates()
    }
    
}
