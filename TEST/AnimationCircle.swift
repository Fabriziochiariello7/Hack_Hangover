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
            AnimationCircleComponent()
                .foregroundColor(Color("blueforbuttons").opacity(0.7))
            AnimationCircleComponent()
                .foregroundColor(Color("blueforbuttons").opacity(0.7))
            AnimationCircleComponent()
                .foregroundColor(Color("blueforbuttons").opacity(0.7))
        }
    }
}

struct AnimationCircleComponent: View {

    let max = 50.0
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
            .shadow(radius: 10)
            .animation(.linear(duration: 1.0), value: pos)
        
            .onReceive(timer) { time in
                if andata{
                    pos.width =  Double.random(in: -max..<max)
                    pos.height = Double.random(in: -max..<max)
                        andata = false
                }else{
                    pos.width = Double.random(in: -max..<max)
                    pos.height = Double.random(in: -max..<max)
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
