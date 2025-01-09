//
//  ContentView.swift
//  VenmoLauncher
//
//  Created by Nolan Kyhl on 1/5/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "arrowshape.turn.up.right.circle.fill")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Venmo Launcher")
                .font(.title)
            Text("Add Widget to Lock Screen")
                .font(.subheadline)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
