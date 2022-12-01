//
//  LocationView.swift
//  Dublin Public Transport
//
//  Created by Dylan Seery on 29/11/2022.
//

import SwiftUI

struct LocationView: View {
    var body: some View {
        ZStack{
            Color.background.ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Image(systemName: "location.circle")
                    .resizable().scaledToFit().frame(width: 150, height: 150).foregroundColor(Color("Alternative")).padding(.bottom, 32)
                Text("Would you like nearby real time data?").font(.system(size: 24, weight: .semibold)).multilineTextAlignment(.center).padding()
                
                Spacer()
                
                VStack {
                    Button {
                        LocationManager.shared.requestLocation()
                    } label: {
                        Text("Allow Location").padding().font(.headline).foregroundColor(.background)
                    }.frame(width: UIScreen.main.bounds.width).padding(.horizontal, -32).background(Color("Alternative")).clipShape(Capsule())
                    Button {
                        print("maybe later")
                    } label: {
                        Text("Maybe Later").padding().font(.subheadline).foregroundColor(Color("BackgroundFlipped"))
                    }.frame(width: UIScreen.main.bounds.width).padding(.horizontal, -32).clipShape(Capsule())
                }.padding(.bottom, 32)
            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
        LocationView().preferredColorScheme(.dark)
    }
}
