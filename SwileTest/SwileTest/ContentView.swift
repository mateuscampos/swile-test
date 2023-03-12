//
//  ContentView.swift
//  SwileTest
//
//  Created by guru on 10/03/23.
//

import SwiftUI

struct ContentView: View {
    var viewModel: TransactionListViewModel = TransactionListViewModel()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onAppear(perform: viewModel.fetch)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
