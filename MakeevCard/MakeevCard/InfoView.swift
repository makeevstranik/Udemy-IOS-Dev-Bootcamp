//
//  InfoView.swift
//  MakeevCard
//
//  Created by Евгений Макеев on 06.02.2022.
//

import SwiftUI

struct InfoView: View {
    let phone: String
    let phoneImageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame( height: 60)
            .foregroundColor(.white)
            .overlay(
                HStack {
                    Image(systemName: phoneImageName).foregroundColor(color)
                    Text(phone)
                        .bold().foregroundColor(.mint)
                        .font(.system(size: 25))
                        .padding([.top, .bottom, .trailing], 10.0)
                })
            .padding()
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(phone: "0-000-000-00-00", phoneImageName: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
