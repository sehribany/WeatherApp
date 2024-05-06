//
//  WeatherService.swift
//  Weather
//
//  Created by Şehriban Yıldırım on 3.05.2024.
//

import Foundation
import CoreLocation

class WeatherManager{
    let apiKey = "f88babcce41a4fa00bccef195bc4bf91"
    
    func fetchWeatherData(for location: CLLocation, completion:@escaping(Weather?) -> Void){
        let url = "https://api.openweathermap.org/data/2.5/weather?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&units=metric&appid=\(apiKey)"
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url){data,response,error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let weatherResponse = try? JSONDecoder().decode(Weather.self, from: data)
            completion(weatherResponse)
            
        }.resume()
    }
}
