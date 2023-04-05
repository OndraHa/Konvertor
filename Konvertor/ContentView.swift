//
//  ContentView.swift
//  Konvertor
//
//  Created by Ondřej Hadraba on 28.03.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List{
                NavigationLink("Distance", destination: ConvertDistanceView())
                NavigationLink("Volume", destination: ConvertVolumeView())
            }
            .navigationTitle("Konvertor jednotek")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
