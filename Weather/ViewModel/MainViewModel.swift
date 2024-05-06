//
//  MainViewModel.swift
//  Weather
//
//  Created by Şehriban Yıldırım on 5.05.2024.
//

import Combine
import CoreLocation
import MapKit

class MainViewModel: ObservableObject {
    @Published var weatherData    : [WeatherData] = []
    @Published var cityAnnotations: [CityAnnotation] = []
    @Published var currentWeather : WeatherData?
    @Published var region         : MKCoordinateRegion?
    @Published var isLoading   = false
    @Published var isSearching = false
    @Published var searchText  = ""
    private var cancellables: Set<AnyCancellable> = []
   
    private var locationManager = LocationManager()
    private var weatherManager  = WeatherManager()

    init() {
        setupLocationUpdates()
    }
    
    func requestWeather() {
        isLoading = true
        locationManager.requestLocation()
    }
    
    private func setupLocationUpdates() {
        locationManager.$location
            .receive(on: DispatchQueue.main)
            .compactMap { $0 }
            .first()
            .sink { [weak self] location in
                self?.updateRegionAndFetchWeather(for: location)
            }
            .store(in: &cancellables)
        locationManager.requestLocation()
    }

    func updateRegionAndFetchWeather(for location: CLLocation) {
        let newRegion = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude),
            span: MKCoordinateSpan(latitudeDelta: 7, longitudeDelta: 7)
        )
        self.region = newRegion
        fetchWeather(for: location)
    }
    
    func fetchWeather(for location: CLLocation) {
        weatherManager.fetchWeatherData(for: location) { [weak self] response in
            DispatchQueue.main.async {
                self?.isLoading = false
                guard let response = response else {
                    print("Error fetching weather data")
                    return
                }
                let newWeatherData = WeatherData(
                    locationName: response.name,
                    temperature: response.main.temp,
                    condition: response.weather.first?.description ?? "No description",
                    highTemp: response.main.tempMax,
                    lowTemp: response.main.tempMin,
                    coordinate: CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude),
                    icon: response.weather.first?.icon ?? ""
                )
                self?.weatherData.append(newWeatherData)
                
                let newAnnotation = CityAnnotation(
                    coordinate: newWeatherData.coordinate,
                    temperature: newWeatherData.temperature,
                    weatherIcon: newWeatherData.icon
                )
                self?.cityAnnotations.append(newAnnotation)
            }
        }
    }

    func searchWeather(for locationString: String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(locationString) { [weak self] placemarks, error in
            guard let self = self, let placemark = placemarks?.first, let location = placemark.location, error == nil else {
                print("Geocoding error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            self.fetchWeather(for: location)
        }
    }
}
