//
//  EntryDetailView.swift
//  Compedium
//
//  Created by tommy yohanes on 14/08/24.
//

import SwiftUI

struct EntryDetailView: View {
    let entry: Entry
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: entry.image))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
            
            Text(entry.name.capitalized)
                .font(.largeTitle)
            Text(entry.description)
                .font(.body)
            
            Spacer()
        }
        .navigationTitle(entry.name.capitalized)
        .padding()
    }
}
