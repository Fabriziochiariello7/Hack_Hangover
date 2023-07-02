//
//  AnimationCircle.swift
//  TEST
//
//  Created by Fabrizio Chiariello on 02/07/23.
//

import SwiftUI

struct AnimationCircle: View {
    
    let timer = Timer
        .publish(every: 0.5, on: .main, in: .common)
    @State var offset = CGSize(width: 0, height: 0  )
    var body: some View {
        Circle()
            .frame(width: 50)
            .position(CGPoint(x: 0 + offset.width, y:  0 + offset.height))
            .animation(.linear(duration: 0.5), value: offset)
        
            .onReceive(timer){ _ in
                let bufX = Double.random(in: -50.0..<50.0)
                let bufY = Double.random(in: -50.0..<50.0)
                let bufOffset = CGSize(width: bufX, height: bufY)
                offset = bufOffset
            }
    }
}

struct AnimationCircle_Previews: PreviewProvider {
    static var previews: some View {
        AnimationCircle()
    }
}
