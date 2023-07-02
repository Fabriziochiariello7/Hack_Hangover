//
//  ContentView.swift
//  TEST
//
//  Created by Fabrizio Chiariello on 31/05/23.
//

import SwiftUI

struct ContentView: View {
    @State var isClicked : Bool = false
    var systemName : String = "person.fill"
    var body: some View {
        NavigationView{
            ZStack {
                Color("Greycolor").ignoresSafeArea()
                NavigationLink(destination: AnimationCircle(), label: {
                    ZStack{
                        Color("Greycolor").ignoresSafeArea()
                        Circle()
                            .foregroundColor(Color("blueforbuttons"))
                            .frame(width: UIScreen.main.bounds.width / 2 * 1.25)
                        Text("**Start** \nSession")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                })
                .onTapGesture(perform: {
                    isClicked.toggle()
                    if isClicked {
                        // CODE FOR STARTING RECORDING ACTIVITY
                    }
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ExtractedView: View {
    var systemname : String = "person.fill"
    var body: some View {
        Circle()
            .frame(width: UIScreen.main.bounds.width / 10, height: UIScreen.main.bounds.height / 10)
            .foregroundColor(.white)
            .overlay{
                Image(systemName: systemname)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.black)
                    .frame(width : UIScreen.main.bounds.width / 20)
                
            }
    }
}
