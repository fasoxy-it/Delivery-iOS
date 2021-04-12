//
//  ContentView.swift
//  Delivery-iOS
//
//  Created by Mattia Fasoli on 12/04/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var pizze: Int = 0
    @State var cokes: Int = 0
    @State var address: String = ""
    @State var premiumDelivery: Bool = false
    
    let pizzaPrice: Double = 11.50
    let cokePrice: Double = 2.50
    let premiumDeliveryPrice: Double = 8.00
    
    var finalPrice: Double {
        (Double(pizze) * pizzaPrice) + (Double(cokes) * cokePrice) + (premiumDelivery ? Double(premiumDeliveryPrice) : 0)
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Menu")
                    .font(.largeTitle)
                    .padding(.bottom, 20)
                
                Spacer()
                
                Button("Resetta", action: {
                    self.pizze = 0
                    self.cokes = 0
                })
            }
            
            Stepper(value: $pizze, in: 0...10, label: {
                HStack {
                    VStack (alignment: .leading) {
                        Text("Pizza Margherita")
                            .fontWeight(.bold)
                        Text("\(format(x: pizzaPrice)) €")
                    }
                    
                    Spacer()
                    
                    Text("\(pizze)")
                }
            })
            
            Stepper(value: $cokes, in: 0...10, label: {
                HStack {
                    VStack (alignment: .leading) {
                        Text("Coca Cola")
                            .fontWeight(.bold)
                        Text("\(format(x: cokePrice)) €")
                    }
                    
                    Spacer()
                    
                    Text("\(cokes)")
                }
            })
            
            HStack {
                Text("Totale")
                    .font(.largeTitle)
                Spacer()
                Text("\(format(x: finalPrice)) €")
                    .font(.largeTitle)
            }
            .padding(.bottom)
            
            if (finalPrice > 0) {
                VStack (alignment: .leading) {
                    Text("Indirizzo di spedizione")
                    TextField("Via...", text: $address)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Toggle(isOn: $premiumDelivery, label: {
                        Text("Priority")
                    })
                    if (address.count > 10) {
                        Text("Consegneremo in ") + Text("\(address)").bold() + Text(" e pagherai un totale di ") + Text("\(format(x: finalPrice)) €").bold()
                    }
                }
            }
            
            Spacer()
            
        }
        .padding()
    }
    
    func format(x: Double) -> String {
        String(format: "%.2f", x)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
