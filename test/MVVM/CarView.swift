//
//  CarView.swift
//  test
//
//  Created by Devis on 05/12/2024.
//

import SwiftUI

struct CarView: View {
    
    @ObservedObject var vm = CarViewModel()
    
    var body: some View {
        Form{
            ForEach(vm.cars){ car in
                DisclosureGroup(car.name){
                    Text("Color: \(car.color)")
                    Text("Condition: \(car.condition)")
                }
            }
            HStack{
                Button("Add Car", action: vm.addCar)
                    .buttonStyle(.borderedProminent)
                Spacer()
                Button("Remove Car", action: vm.removeCar)
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    CarView()
}
