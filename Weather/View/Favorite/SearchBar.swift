//
//  SearchBar.swift
//  Weather
//
//  Created by Şehriban Yıldırım on 5.05.2024.
//
import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var onSearch: () -> Void

    var body: some View {
        HStack {
            TextField("Search for places", text: $text, onCommit: onSearch)
                .padding(10)
                .background(.appBlack)
                .cornerRadius(8)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 8).stroke(.appLightPurple, lineWidth: 0.5))
                .padding(.horizontal, 2)

            Button(action: {
                onSearch()
                self.text = ""
            }) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.appLightPurple)
            }
        }
        .padding(.horizontal)
        .background(.clear)
    }
}
