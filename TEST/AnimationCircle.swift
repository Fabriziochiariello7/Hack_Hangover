//
//  AnimationCircle.swift
//  TEST
//
//  Created by Fabrizio Chiariello on 02/07/23.
//

import SwiftUI

struct AnimationCircle: View{
    var body: some View{
        ZStack{
            
                Color("Greycolor").ignoresSafeArea()
            AnimationCircleComponent()
                .foregroundColor(.blue.opacity(0.7))
            AnimationCircleComponent()
                .foregroundColor(.blue.opacity(0.7))
            AnimationCircleComponent()
                .foregroundColor(.blue.opacity(0.7))
        }
    }
}

struct AnimationCircleComponent: View {

    @State var gesture : String = ""
    @State var andata = true
    @State var scaleFlag : Double = 0
    @State var doubleDown : Bool = false
    @State var upOutside : Bool = false
    @State var pos = CGSize(width: 0.0, height: 0.0)
    let timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        
        Circle()
            .scaleEffect(0.6)
            .offset(x: pos.width, y: pos.height)
            .animation(.linear(duration: 1.0), value: pos)
        
            .onReceive(timer) { time in
                if andata{
                    pos.width =  Double.random(in: -40.0..<40.0)
                    pos.height = Double.random(in: -40.0..<40.0)
                        andata = false
                }else{
                    pos.width = Double.random(in: -40.0..<40.0)
                    pos.height = Double.random(in: -40.0..<40.0)
                        andata = true
                }
            }
    }
}




struct AnimationCircle_Previews: PreviewProvider {
    static var previews: some View {
        AnimationCircle()
    }
}
