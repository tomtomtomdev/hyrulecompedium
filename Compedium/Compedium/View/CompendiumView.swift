//
//  CompendiumView.swift
//  Compedium
//
//  Created by tommy yohanes on 14/08/24.
//

import SwiftUI

struct CompendiumView: View {
    @StateObject private var viewModel = CompendiumViewModel()
    @State private var presentedError = false
    
    var body: some View {
        NavigationView {
            List(viewModel.entries) { entry in
                NavigationLink(destination: EntryDetailView(entry: entry)) {
                    Text(entry.name.capitalized)
                }
            }
            .navigationTitle("Hyrule Compendium")
            .onAppear {
                viewModel.fetchEntries()
            }
            .alert("Error", isPresented: $viewModel.isErrorPresented) {
                Button("OK", role: .cancel) { 
                    viewModel.error = nil
                }
            } message: {
                if let error = viewModel.error {
                    Text(error.localizedDescription)
                }
            }
        }
    }
}

extension Error? {
    var isPresent: Bool {
        self != nil
    }
}
