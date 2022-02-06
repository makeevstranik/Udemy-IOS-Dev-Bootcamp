//
//  ContentView.swift
//  MakeevCard
//
//  Created by Евгений Макеев on 05.02.2022.
//

import SwiftUI
let color = Color(red: 0.09, green: 0.63, blue: 0.52, opacity: 1.0)
struct ContentView: View {
    var body: some View {
        ZStack {
            color
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("pepa")
                    .resizable().aspectRatio(contentMode: .fit).frame(width: 250, height: 250
                    ).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color.mint, lineWidth: 5))
                Text("Makeev \n Evgeny")
                    .font(Font.custom("Rowdies-Regular", size: 40))
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                Divider()
                InfoView(phone: "+7-908-938-55-68", phoneImageName: "phone.fill")
                InfoView(phone: "makeevstranik@gmail.com", phoneImageName: "envelope.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}




