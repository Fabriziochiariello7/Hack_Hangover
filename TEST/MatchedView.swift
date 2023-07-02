//
//  MatchedView.swift
//  TEST
//
//  Created by Fabrizio Chiariello on 13/06/23.
//

import SwiftUI

struct MatchedView: View {
    @Namespace var namespace
    @State var show = false
    
    var body: some View {
        ZStack {
            if !show {
                VStack {
                    Text("Helloski")
                        .matchedGeometryEffect(id: "Quote", in: namespace)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    
                }
                .padding(20)
                .foregroundStyle(.white)
                .background(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .opacity(0.2)
                        .matchedGeometryEffect(id: "background", in: namespace)
                )
                .mask(
                    RoundedRectangle(cornerRadius: 30, style: .continuous))
                .matchedGeometryEffect(id: "Mask", in: namespace
                )
            }
            else {
                ScrollView {
                    VStack {
                        Text("Helloski")
                            .matchedGeometryEffect(id: "Quote", in: namespace)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .frame(height: 400)
                    .padding(20)
                    .foregroundStyle(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .opacity(0.2)
                            .padding()
                            .matchedGeometryEffect(id: "background", in: namespace)
                    )
                    .mask(
                        RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .matchedGeometryEffect(id: "Mask", in: namespace
                )
                }
                
            }
            
        }
        .background(
            Image("BackGround")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                  
        )
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)){
                show.toggle()
            }
            
        }
    }
}

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView()
    }
}
