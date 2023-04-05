//
//  ConvertVolumeView.swift
//  Konvertor
//
//  Created by Ondřej Hadraba on 03.04.2023.
//

import SwiftUI

struct ConvertVolumeView: View {
    @State private var inputVolume: Double = 1
    @State private var inputUnitVolume = "m3"
    let allUnitVolume = ["m3", "cm3", "ml", "dm3", "l", "hl", "dl", "cl", "fl dr", "fl oz", "gi", "pt", "qt", "gal"]
    var inputToM3: Double{
        var convertToM3: Double
        switch inputUnitVolume{
        case "m3":
            convertToM3 = inputVolume * 1
        case "cm3":
            convertToM3 = inputVolume / 1_000_000
        case "ml":
            convertToM3 = inputVolume / 1_000_000
        case "dm3":
            convertToM3 = inputVolume / 1_000
        case "l":
            convertToM3 = inputVolume / 1_000
        case "hl":
            convertToM3 = inputVolume / 10
        case "dl":
            convertToM3 = inputVolume /  10_000
        case "cl":
            convertToM3 = inputVolume / 100_000
        case "fl dr":
            convertToM3 = inputVolume / 270_512.27
        case "fl oz":
            convertToM3 = inputVolume / 33_814.06
        case "gi":
            convertToM3 = inputVolume / 8_453.51
        case "pt":
            convertToM3 = inputVolume / 1_759.75
        case "qt":
            convertToM3 = inputVolume / 1_056.69
        case "gal":
            convertToM3 = inputVolume / 264.1721769
        default: convertToM3 = 0
            
            
        }
        return convertToM3
    }
    var body: some View {
        Form{
            Section("zadej jednotky"){
                TextField("Zadej objem", value: $inputVolume, format: .number)
                    .keyboardType(.decimalPad)
                Picker("jednotky", selection: $inputUnitVolume){
                    ForEach(allUnitVolume, id: \.self){
                        Text($0)
                    }
                }
            }
            Section("Metrické"){
                Text("\(volumeCount(inputToM3, output: "m3")) m3")
                Text("\(volumeCount(inputToM3, output: "cm3")) cm3")
                Text("\(volumeCount(inputToM3, output: "ml")) ml")
                Text("\(volumeCount(inputToM3, output: "dm3")) dm3")
                Text("\(volumeCount(inputToM3, output: "l")) l")
                Text("\(volumeCount(inputToM3, output: "hl")) hl")
                Text("\(volumeCount(inputToM3, output: "dl")) dl")
                Text("\(volumeCount(inputToM3, output: "cl")) cl")
                
                
            }
            Section("Imperiální"){
                Text("\(volumeCount(inputToM3, output: "fl dr")) fl dr")
                Text("\(volumeCount(inputToM3, output: "fl oz")) fl oz")
                Text("\(volumeCount(inputToM3, output: "gi")) gi")
                Text("\(volumeCount(inputToM3, output: "pt")) pt")
                Text("\(volumeCount(inputToM3, output: "qt")) cm3")
                Text("\(volumeCount(inputToM3, output: "gal")) gal")
            }
            
        }
    }
    func volumeCount(_ Volume: Double, output: String) -> String{
        var vystup: Double
        switch output{
        case "m3":
            vystup = Volume * 1
        case "cm3":
            vystup = Volume * 1_000_000
        case "ml":
            vystup = Volume * 1_000_000
        case "dm3":
            vystup = Volume * 1_000
        case "l":
            vystup = Volume * 1_000
        case "hl":
            vystup = Volume * 10
        case "dl":
            vystup = Volume * 10_000
        case "cl":
            vystup = Volume * 100_000
        case "fl dr":
            vystup = Volume * 270_512.27
        case "fl oz":
            vystup = Volume * 33_814.06
        case "gi":
            vystup = Volume * 8_453.51
        case "pt":
            vystup = Volume * 1_759.75
        case "qt":
            vystup = Volume * 1_056.69
        case "gal":
            vystup = Volume * 264.1721769
        default:
            vystup = Volume
        }
        return "\(vystup)"
    }
}

struct ConvertVolumeView_Previews: PreviewProvider {
    static var previews: some View {
        ConvertVolumeView()
    }
}
