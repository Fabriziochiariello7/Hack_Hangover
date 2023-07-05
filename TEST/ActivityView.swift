//
//  ActivityView.swift
//  TEST
//
//  Created by Raffaele Martone on 02/07/23.
//

import SwiftUI

struct ActivityView: View {
    @State var ActivityAlertIsPresented = false
    
    
    @State var isOption1Selected = false
    
    var body: some View {
        GeometryReader{
            geo in
            ZStack{
                Color("Greycolor").ignoresSafeArea()
                VStack{
                    AnimationCircle()
                }
                Button(action: { ActivityAlertIsPresented = true }){
                    VStack{
                        Text("Termina sessione")
                            .padding()
                    }
                    .background(){
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                    }
                }.position(CGPoint(x: geo.size.width/2, y: geo.size.height  * 0.9))
                NavigationLink(
                    destination: GameView(finish: Date().addingTimeInterval(180)),
                    isActive: $isOption1Selected
                ) {
                    EmptyView()
                }
                .hidden()
                .actionSheet(isPresented: $ActivityAlertIsPresented) {
                    ActionSheet(
                        title: Text("Vuoi mettere in pausa la sessione?"),
                        message: Text("Scegli una delle seguenti azioni"),
                        buttons: [
                            .default(Text("Sì, voglio mettere in pausa")) {
                                isOption1Selected  = true
                            },
                            .default(Text("No interrompi la sessione")) {
                                ActivityAlertIsPresented = false
                            },
                            .cancel() // Opzione di cancellazione
                        ]
                    )
                }
            }
            
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
