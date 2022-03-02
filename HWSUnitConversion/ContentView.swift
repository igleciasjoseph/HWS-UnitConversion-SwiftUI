//
//  ContentView.swift
//  HWSUnitConversion
//
//  Created by Joseph Iglecias on 3/1/22.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumber = 0.0
    @State private var inputSelected = "Feet"
    @State private var outputNumber = 0.0
    @State private var outputSelected = "Miles"
    @FocusState private var isFocused : Bool
    
    let inputUnits = ["Feet", "Yards", "Meters", "Kilometers", "Miles"]
    let outputUnits = ["Feet", "Yards", "Meters", "Kilometers", "Miles"]
    
    var result: Double {
        
        let value = Double(inputNumber)
        
        var input = Double(inputNumber)
        var output = Double(outputNumber)
        
        
        guard value > 0 else {
            return 0
        }
        
        // Converts input value to base-feet
        switch inputSelected {
            case "Meters":
                input = value * 3.28
            case "Kilometers":
                input = value * 3280.84
            case "Yards":
                input = value * 3
            case "Miles":
                input = value * 5280
            case "Feet":
                input = value * 1
            default:
                input = value * 3.28
        }
        
        // Converts input unit to output unit
        switch outputSelected {
            case "Meters":
                output = input / 3.28
            case "Kilometers":
                output = input / 3280.84
            case "Yards":
                output = input / 3
            case "Miles":
                output = input / 5280
            case "Feet":
                output = input / 1
            default:
                output = input / 3.28
        }
        
        return output
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter a value", value: $inputNumber, format: .number)
                        .keyboardType(.numberPad)
                        .focused($isFocused)
                    
                } header: {
                    Text("Enter a value")
                }
                
                Section(header: Text("Input Units")) {
                    Picker("Input Units", selection: $inputSelected) {
                        ForEach(inputUnits, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section(header: Text("Output Units")) {
                    Picker("Input Units", selection: $outputSelected) {
                        ForEach(outputUnits, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section (header: Text("output")){
                    Text(result, format: .number)
                }
            }
            .navigationBarTitle("Unit Conversion")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        isFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
