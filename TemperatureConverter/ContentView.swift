//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by Madison Dellamea on 12/2/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var celsius: Double = -5.00

    var fahrenheit: Double {
        return (celsius * 9/5) + 32
    }
    
    @State var feedback = ""
    
    var body: some View {
        
        VStack(alignment:.leading){
            
            Text("Celsius")
                .font(.title2)
                .bold()
            
            Slider(value: $celsius,
                   in: -50.0...50.0,
                   step: 1.0,
                   label: {
                Text("Celsius")
            },
                   minimumValueLabel: {
                Text("-50.0")
            },
                   maximumValueLabel: {
                Text("50.0")
            })

            HStack {
                Spacer()
                Text("\( String(format: "%.0f", celsius)) C°")
                    .font(.title2)
                    .bold()
                    .padding()
                
                Spacer()
            }
            
            Text("Fahrenheit")
                .font(.title2)
                .bold()
            
            HStack {
                Spacer()
                Text("\( String(format: "%.0f", fahrenheit)) F°")
                    .font(.title2)
                    .bold()
                    .padding()
                
                
                Spacer()
            }
            Spacer()
        }
        .padding(.horizontal)
        .navigationTitle("Temperature Converter")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        ContentView()
        }
    }
}
