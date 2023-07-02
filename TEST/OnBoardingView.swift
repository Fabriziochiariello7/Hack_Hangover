//
//  OnBoardingView.swift
//  TEST
//
//  Created by Fabrizio Chiariello on 01/07/23.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("finishedOnBoarding") var finishedOnBoarding = false
    
    let pages: [OnboardingPage]
    @State var isFinished: Bool = false
    
    @State private var currentPage: Int = 0
    @State private var toggleView: Bool = Bool()
    @State private var animation: Animation? = Animation.default
    
    var body: some View {
        
        GeometryReader { proxy in
            
            Image(pages[currentPage].backgroundImage)
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            
            VStack {
                
                Spacer()
                
                if toggleView {
                    middleVStack(index: currentPage, proxy: proxy.size).transition(AnyTransition.asymmetric(insertion: AnyTransition.move(edge: Edge.trailing), removal: AnyTransition.move(edge: Edge.leading)))
                }
                else {
                    middleVStack(index: currentPage, proxy: proxy.size).transition(AnyTransition.asymmetric(insertion: AnyTransition.move(edge: Edge.trailing), removal: AnyTransition.move(edge: Edge.leading)))
                }
                
                Spacer()
                
                Button(action: {
                    
                    if (pages.count > (currentPage + 1)) { currentPage += 1; animation = .default; toggleView.toggle() }
                    else { isFinished = true }
                    
                    
                }, label: {
                    
                    Text(pages[currentPage].stringOfButton)
                        .font(Font.body.bold())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(pages[currentPage].colorOfButton.cornerRadius(10.0))
                        .padding()
                    
                })
                
                HStack {
                    
                    ForEach(pages.indices, id:\.self) { index in
                        
                        Circle()
                            .fill(Color("Greycolor").opacity(index == currentPage ? 1.0 : 0.5))
                            .frame(width: 12, height: 12, alignment: .center)
                            .onTapGesture { animation = nil ; currentPage = index }
                        
                    }
                }
                
            }
            .foregroundColor(.white)
            .shadow(radius: 5.0)
            .animation(animation, value: currentPage)
            .onChange(of: isFinished) { newValue in
                if newValue {
                    finishedOnBoarding = true
                }
            }
            
        }
        
    }
    
    func middleVStack(index: Int, proxy: CGSize) -> some View {
        
        VStack {
            pages[index].image.font(Font.system(size: 100.0).bold())
                .position(CGPoint(x: proxy.width / 2, y: proxy.height / 4))
            
            Text(pages[index].info)
                .font(Font.system(.headline, design: .rounded).bold())
                .foregroundColor(Color("Greycolor"))
                .multilineTextAlignment(.center)
                .position(x: proxy.width / 2, y: proxy.height / 3)
        }
        
        
        
    }
    
}

struct OnboardingPage: Identifiable {
    let id: UUID = UUID()
    var backgroundImage: String
    var image: Image
    var info: String
    var stringOfButton: String
    var colorOfButton: Color
}

let info1: String = "Benvenuti in Wakey! Wakey ti aiuta a capire quando hai un attacco di sonnambulismo grazie ad un dispositivo che puoi portare comodamente alla caviglia mentre dormi"
let info2: String = "Fa partire la sessione quando vai a dormire per monitorare il tuo sonno. Grazie al nostro algoritmo, saremo in grado di rilevare quando stai camminando, e partirà un'attività"
let info3: String = "Clicca sui pulsanti illuminati per dimostrare di essere sveglio"
let info4 : String = "Se non completerai l'attività verranno allertati i tuoi contatti. Qui potrai aggiungere i contatti da avvertire."
let info5 : String = "Qui potrai controllare il resoconto del tuo sonno e controllare eventuali episodi di sonnambulismo"
let info6 : String = "Cerca il device tra i dispositivi Bluetooth e assicurati che il dispositivo sia connesso."

