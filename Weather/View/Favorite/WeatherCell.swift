//
//  WeatherCell.swift
//  Weather
//
//  Created by Şehriban Yıldırım on 5.05.2024.
//

import SwiftUI

struct WeatherCell: View {
    let weather: WeatherData
    
    var body: some View {
        VStack {
            HStack {
                Text(weather.locationName)
                    .foregroundColor(.black)
                Spacer()
                Text("\(weather.temperature, specifier: "%.1f") °C")
                    .foregroundColor(.black)
            }
            Text("\(weather.highTemp, specifier: "%.1f") °C")
                .foregroundColor(.black)
            Text("\(weather.lowTemp, specifier: "%.1f") °C")
                .foregroundColor(.black)
            Text(weather.condition)
                .foregroundColor(.black)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 5)
        .padding(.horizontal)
    }
}
