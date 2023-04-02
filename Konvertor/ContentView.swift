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
            NavigationLink("Distance", destination: ConvertDistanceView())
        }

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
