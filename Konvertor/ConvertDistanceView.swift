//
//  ConvertDistanceView.swift
//  Konvertor
//
//  Created by Ondřej Hadraba on 30.03.2023.
//

struct Unit: Hashable{
    var label = ""
    var toMM: Double = 0
    
}


import SwiftUI
struct ConvertDistanceView: View {
    @State private var inputDistance: Double = 1
    @State private var inputUnit = Unit(label: "Km", toMM: 1_000_000)
    let allUnit: [Unit] = [
        Unit(label: "Km", toMM: 1_000_000),
        Unit(label: "m", toMM: 1_000),
        Unit(label: "cm", toMM: 10),
        Unit(label: "mm", toMM: 1),
        Unit(label: "mi", toMM: 1_609_344),
        Unit(label: "yd", toMM: 914.4),
        Unit(label: "ft", toMM: 304.8),
        Unit(label: "in", toMM: 25.4),
    ]
    
    
    var body: some View {
        Form{
            Section("Zadej jednotky"){
                TextField("Zadej vzdálenost", value: $inputDistance, format: .number)
                    .keyboardType(.decimalPad)
                Picker("Jednotky", selection: $inputUnit) {
                    ForEach(allUnit, id: \.label){
                        Text($0.label).tag($0 as Unit)
                    }
                }
                .pickerStyle(.menu)
            }
            Section("Metrické"){
                Text("\((inputDistance*inputUnit.toMM)/1_000_000, specifier: "%.6f") Km")
                Text("\((inputDistance*inputUnit.toMM)/1_000, specifier: "%.6f") m")
                Text("\((inputDistance*inputUnit.toMM)/10, specifier: "%.6f") cm")
                Text("\((inputDistance*inputUnit.toMM)/1, specifier: "%.6f") mm")
                
                
            }
            Section("Imperiální"){
                Text("\((inputDistance*inputUnit.toMM)/1_609_344, specifier: "%.6f") mi")
                Text("\((inputDistance*inputUnit.toMM)/914.4, specifier: "%.6f") yd")
                Text("\((inputDistance*inputUnit.toMM)/304.8, specifier: "%.6f") ft")
                Text("\((inputDistance*inputUnit.toMM)/25.4, specifier: "%.6f")in")
            }
        }
        .navigationTitle("Vzdálenost")
    }
}

struct ConvertDistanceView_Previews: PreviewProvider {
    static var previews: some View {
        ConvertDistanceView()
    }
}

