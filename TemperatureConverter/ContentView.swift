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
            
            Button(action: {
                
                let currentcelsius = Int(celsius)
                
                if currentcelsius >= -50 && currentcelsius < 20 {
                    feedback = "Dress for cold weather!"
                } else if currentcelsius >= -20 && currentcelsius < 0 {
                    feedback = "Dress warmly!"
                } else if currentcelsius >= 0 && currentcelsius < 10 {
                    feedback = "Dress for neutral weather!"
                } else if currentcelsius >= 10 && currentcelsius < 20 {
                    feedback = "Dress for slightly chilly weather!"
                } else if currentcelsius >= 20 && currentcelsius < 30 {
                    feedback = "Hot weather, don't bring a jacket!"
                } else if currentcelsius >= 30 && currentcelsius < 50 {
                    feedback = "VERY HOT!"
                }
            }, label: {
                Text("Submit")
            })
            .buttonStyle(.bordered)
            
            Text(feedback)
                .italic()
                .padding()
            
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
