//
//  WeatherSummaryView.swift
//  Weather
//
//  Created by Şehriban Yıldırım on 3.05.2024.
//

import SwiftUI

struct WeatherSummaryView: View {
    var weatherData: WeatherData
    var body: some View {
        VStack(spacing: 15) {
            AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(weatherData.icon)@2x.png")) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 90, height: 90)
                        .aspectRatio(contentMode: .fit)
            
            Text(weatherData.locationName)
                .font(Font.system(size: 40))
                .font(.title).bold()
                .foregroundColor(.white)
            
            Text("\(weatherData.temperature, specifier: "%.1f") ºC")
                .font(Font.system(size: 20))
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
            
            Text(weatherData.condition)
                .font(Font.system(size: 20))
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
            
            Text("H:\(weatherData.highTemp, specifier: "%.1f") ºC  L:\(weatherData.lowTemp, specifier: "%.1f") ºC")
                .font(Font.system(size: 20))
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
        }
        .padding(50)
        .padding(.horizontal, 40)
        .cornerRadius(25)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 25))
    }
}
