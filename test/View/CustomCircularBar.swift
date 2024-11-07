//
//  CustomCircularBar.swift
//  test
//
//  Created by Devis on 07/11/2024.
//

import SwiftUI

struct CustomCircularBar: View {
    
    @State var value = 0.0
    @State var displayedValue = 0.0
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 24)
                .frame(width: 200, height: 200)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 10, y: 10)
            Circle()
                .stroke(lineWidth: 0.34)
                .frame(width: 175, height: 175)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.black.opacity(0.1), .clear]),
                                                startPoint: .bottomTrailing, endPoint: .topLeading))
                .overlay{
                    Circle()
                        .stroke(.black.opacity(0.1), lineWidth: 2)
                        .blur(radius: 5)
                        .mask{
                            Circle()
                                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.black, .clear]),
                                                                startPoint: .topLeading,
                                                                endPoint: .bottomTrailing))
                        }
                }
            Circle()
                .trim(from: 0, to: value)
                .stroke(style: StrokeStyle(lineWidth: 24, lineCap: .round))
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(-90))
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.blue, .purple]),
                                                startPoint: .topLeading, endPoint: .bottomTrailing))
            NumValue(displayedValue: displayedValue, color: .black)
        }
        .onTapGesture {
            withAnimation(.spring().speed(0.8)){
                value += 0.1
                displayedValue += 10
            }
        }
    }
}

struct NumValue: View {
    
    var displayedValue: CGFloat
    var color: Color
    
    var body: some View {
        Text("\(Int(displayedValue))%")
            .bold()
            .font(.largeTitle)
            .foregroundColor(color)
    }
}

#Preview {
    CustomCircularBar()
}
