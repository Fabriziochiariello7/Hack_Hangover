//
//  TESTApp.swift
//  TEST
//
//  Created by Fabrizio Chiariello on 31/05/23.
//

import SwiftUI

@main
struct sens8App: App {
    @AppStorage("finishedOnBoarding") var finishedOnBoarding = false
    
    var pages: [OnboardingPage] = [OnboardingPage(backgroundImage: "BackGround", image: Image(systemName: "person.circle.fill"), info: info1, stringOfButton: "Next", colorOfButton: Color("Greycolor")),
                                   OnboardingPage(backgroundImage: "BackGround", image: Image( "StartSessionImage"), info: info2, stringOfButton: "Next", colorOfButton: Color("Greycolor")),
                                   OnboardingPage(backgroundImage: "BackGround", image: Image("4balls"), info: info3, stringOfButton: "Next", colorOfButton: Color("Greycolor")),
                                   OnboardingPage(backgroundImage: "BackGround", image: Image(systemName: "person.circle.fill"), info: info4, stringOfButton: "Next", colorOfButton: Color("Greycolor")),
                                   OnboardingPage(backgroundImage: "BackGround", image: Image(systemName: "list.bullet.circle.fill"), info: info5, stringOfButton: "Next", colorOfButton: Color("Greycolor")),
                                   OnboardingPage(backgroundImage: "BackGround", image: Image("BluetoothFinal"), info: info6, stringOfButton: "Get Started!", colorOfButton: Color("Greycolor"))]
    
    var body: some Scene {
        WindowGroup {
            if !finishedOnBoarding {
                OnboardingView(pages: pages)
            } else{
                ContentView()
            }
        }
    }
}
