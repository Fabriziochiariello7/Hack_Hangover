//
//  GameView.swift
//  TEST
//
//  Created by Raffaele Martone on 02/07/23.
//

import SwiftUI

struct GameView: View {
    let timer = Timer
        .publish(every: 0.1, on: .main, in: .common)
        .autoconnect()
    @State var activityTime = 0
    let finish : Date
    
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                Color("Greycolor").ignoresSafeArea()
                VStack{
                    Text(formatSecondsToMS(activityTime))
                        .foregroundColor(.white)
                        .font(.title)
                        .bold()
                }
                .position(CGPoint(x: geo.size.width/2, y: geo.size.height * 0.1))
                
                
                .onReceive(timer){ _ in
                    activityTime = Int(finish.timeIntervalSince(Date()))
                }
                .navigationBarBackButtonHidden(true)
            }
        }
    }
    func formatSecondsToMS(_ totalSeconds: Int) -> String {
        let minutes = (totalSeconds % 3600) / 60
        let seconds = (totalSeconds % 3600) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView( finish: .now)
    }
}
