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
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
        }
        .padding()
        .background(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
