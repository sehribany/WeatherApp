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
                .padding(8)
                .background(Color(.systemGray5))
                .cornerRadius(8)
                .padding(.horizontal, 10)

            Button(action: {
                onSearch()
            }) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
            }
            .padding(.trailing, 10)
        }
        .padding(.horizontal)
    }
}

