//
//  ConvertSpeedView.swift
//  Konvertor
//
//  Created by Ondřej Hadraba on 06.04.2023.
//

struct SpeedUnit: Hashable{
    var toMs: Double = 0
    var label = ""
    var type = ""
}

import SwiftUI

struct ConvertSpeedView: View {
    @State private var inputSpeed: Double = 10
    var units: [SpeedUnit] = [
        SpeedUnit(toMs: 1, label: "m/s", type: "metric"),
        SpeedUnit(toMs: 3.5999971, label: "Km/h", type: "metric"),
        SpeedUnit(toMs: 2.2369363, label: "MPH", type: "imperial"),
        SpeedUnit(toMs: 1.9438462, label: "kn", type: "imperial"),
        SpeedUnit(toMs: 3.2808399, label: "ft/s", type: "imperial"),
        SpeedUnit(toMs: 0.003017, label: "Mach", type: "metric"),
    ]
    @State private var inputUnit = SpeedUnit(toMs: 1, label: "m/s", type: "metric")
    
    var body: some View {
        Form{
            Section("Zadej jednotky"){
                TextField("Zadej rychlost", value: $inputSpeed, format: .number)
                    .keyboardType(.decimalPad)
                Picker("Jednotky", selection: $inputUnit) {
                    ForEach(units, id: \.label){
                        Text($0.label).tag($0 as SpeedUnit)
                    }
                }
                .pickerStyle(.menu)
            }
            Section("Metrické"){
                ForEach(units, id: \.label) {
                    if ($0.type == "metric") {
                        Text("\((inputSpeed/inputUnit.toMs)*$0.toMs, specifier: "%.6f") \($0.label)")
                    }
                }
            }
            Section("Imperiální"){
                ForEach(units, id: \.label) {
                    if ($0.type == "imperial") {
                        Text("\((inputSpeed/inputUnit.toMs)*$0.toMs, specifier: "%.6f") \($0.label)")
                    }
                }
            }
        }
        .navigationTitle("Vzdálenost")
    }
}

struct ConvertSpeedView_Previews: PreviewProvider {
    static var previews: some View {
        ConvertSpeedView()
    }
}
