//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Gaurav Sharma on 27/06/24.
//

import SwiftUI

struct WeatherButton:View {
    var title: String
    var backgroundColor : Color
    var textColor : Color
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor.gradient)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(8)
    }
}

#Preview {
    WeatherButton(title: "button", backgroundColor: .blue, textColor: .white)
}
