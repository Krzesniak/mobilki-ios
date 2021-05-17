//
//  ContentView.swift
//  Shared
//
//  Created by Guest User on 05/05/2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        ScrollView(){
        VStack {
            ForEach(viewModel.records) {
                record in WeatherView(record: record, viewModel: viewModel)
            }
        }.padding()
        }
    }
}

struct WeatherView: View {
    var record: WeatherModel.WeatherRecord
    var viewModel: WeatherViewModel
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).stroke()
                .frame(height: 150, alignment: .center)
            GeometryReader { geometry in HStack {
                Text(verbatim: viewModel.getIcon(record: record)).font(.largeTitle)
                    .frame(width: geometry.size.width * 0.20)
            
                VStack(alignment: .leading
            ) {
                    Text(record.cityName)
                    
                    Text("Temperature: \(record.temperature, specifier: "%.2f")'C")
                        .font(.caption)
                }.frame(width: geometry.size.width * 0.6)
                Text("🔁")
                    .font(.largeTitle)
                    .frame(height: geometry.size
                            .height)
    
                    .onTapGesture {
                        viewModel.refresh(record: record)
                    }
            }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: WeatherViewModel())
    }
}
