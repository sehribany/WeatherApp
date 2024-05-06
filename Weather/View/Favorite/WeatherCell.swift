//
//  WeatherCell.swift
//  Weather
//
//  Created by Şehriban Yıldırım on 5.05.2024.
//

import SwiftUI

struct WeatherCell: View {
    let weather: WeatherData
    
    var backgroundName: String {
        let hour = Calendar.current.component(.hour, from: Date())
        return (6...18).contains(hour) ? "cloud" : "star"
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(weather.locationName)
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.white)
                
                Text(weather.condition)
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text("\(weather.temperature, specifier: "%.1f")°C")
                    .font(.system(size: 23, weight: .bold))
                    .foregroundColor(.white)

                HStack {
                    Text("H: \(weather.highTemp, specifier: "%.1f")°C")
                        .foregroundColor(.white)

                    Text("L: \(weather.lowTemp, specifier: "%.1f")°C")
                        .foregroundColor(.white)
                }
            }
        }
        .padding(10)
        .background(            
            Image(backgroundName)
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all) )
        .cornerRadius(20)
        .padding(.horizontal, 16)
    }
}
