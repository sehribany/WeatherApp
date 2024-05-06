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
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Group {
            if let region = viewModel.region {
                Map(coordinateRegion: .constant(region), annotationItems: viewModel.cityAnnotations) { annotation in
                    MapAnnotation(coordinate: annotation.coordinate) {
                        VStack {
                            AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(annotation.weatherIcon)@2x.png")) { image in
                                                            image.resizable()
                                                                .aspectRatio(contentMode: .fit)
                                                                .frame(width: 30, height: 30)
                                                        } placeholder: {
                                                            ProgressView()
                                                        }
                            Text("\(annotation.temperature, specifier: "%.1f")°C")
                                .foregroundColor(.black)
                                .bold()
                        }
                        .padding(5)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }
                }.edgesIgnoringSafeArea(.all)
            } else {
                Text("Determining your location...")
            }
        }
        .background(.appBlack)
        .navigationTitle("Map")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {self.presentationMode.wrappedValue.dismiss()}) {
            Image(systemName: "chevron.left")
                .foregroundColor(.white)
        })
        
    }
}
