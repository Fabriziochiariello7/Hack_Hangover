//
//  SettingsView.swift
//  TEST
//
//  Created by Fabrizio Chiariello on 12/06/23.
//

import SwiftUI

struct SettingsView: View {
    @State var enteredNumber : String = ""
    @AppStorage("phoneNumber") private var phoneNumber : String = ""
    @State var finishedSaving : Bool = false
    var body: some View {
        if finishedSaving{
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                Text(phoneNumber)
                    .foregroundColor(Color("Greycolor"))
            }
        }
        else{
        ZStack{
            Color("Greycolor").ignoresSafeArea()
            VStack{
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                    TextField("Insert number of loved one...", text: $enteredNumber)
                        .foregroundColor(Color("Greycolor"))
                        .keyboardType(.numberPad)
                        .padding()
                }
                .frame(width: UIScreen.main.bounds.width * 3 / 3, height: UIScreen.main.bounds.height / 10)
                .padding()
                
                Button(action: {
                    enteredNumber = phoneNumber
                    finishedSaving.toggle()
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                        Text("Save")
                        
                            .foregroundColor(Color("Greycolor"))
                        
                    }
                })
                .frame(width: UIScreen.main.bounds.width * 3 / 3, height: UIScreen.main.bounds.height / 20)
            }
            .foregroundColor(.white)
            
            
        }
    }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
