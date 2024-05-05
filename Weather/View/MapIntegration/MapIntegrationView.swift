//
//  MapIntegrationView.swift
//  Weather
//
//  Created by Şehriban Yıldırım on 3.05.2024.
//

import SwiftUI
import MapKit

struct MapIntegrationView: View {
    @ObservedObject var viewModel: MainViewModel

    var body: some View {
        NavigationView {
            Group {
                if let region = viewModel.region {
                    Map(coordinateRegion: .constant(region), annotationItems: viewModel.cityAnnotations) { annotation in
                        MapAnnotation(coordinate: annotation.coordinate) {
                            VStack {
                                Image(systemName: annotation.weatherIcon)
                                    .foregroundColor(.red)
                                Text("\(annotation.temperature, specifier: "%.1f")°C")
                                    .foregroundColor(.black)
                                    .bold()
                            }
                            .padding(5)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        }
                    }
                } else {
                    Text("Determining your location...")
                }
            }
            .navigationTitle("Map")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
