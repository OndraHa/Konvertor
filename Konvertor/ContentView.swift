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
            ScrollView{
                NavigationLink{
                    ConvertDistanceView()
                } label: {
                    LinkView(topColor: .blue, bottomColor: .cyan, headerTitle: "Vzdálenost", titleImage: "Image")
                    
                }
                NavigationLink{
                    ConvertVolumeView()
                } label: {
                    LinkView(topColor: .orange, bottomColor: .yellow, headerTitle: "Objem", titleImage: "Image")
                    
                }
                NavigationLink{
                    ConvertSpeedView()
                } label: {
                    LinkView(topColor: .red, bottomColor: .pink, headerTitle: "Rychlost", titleImage: "Image")
                    
                }
            }
            
            
            
/*            List{
                NavigationLink("Distance", destination: ConvertDistanceView())
                NavigationLink("Volume", destination: ConvertVolumeView())
            }
 */
            .navigationTitle("Konvertor jednotek")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
