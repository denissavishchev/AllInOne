//
//  SettingsView.swift
//  test
//
//  Created by Devis on 05/11/2024.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var selectedItem: String? = nil
    
    var body: some View {
        VStack{
            ZStack{
                Color.black.opacity(0.8).edgesIgnoringSafeArea(.all)
                CustomDropdownPicker(
                    selectedItem: $selectedItem,
                    availableOptions: [
                    "Apple",
                    "Orange",
                    "Kiwi",
                    "Banana",
                    "Coconut"
                    ]
                )
                
            }
            .frame(width: .infinity, height: 70)
            .padding(.bottom, 20)
            Text("Slider")
            Spacer()
        }
    }
}

enum DropdownPosition{
    case above
    case below
}

struct CustomDropdownPicker: View {
    
    @Binding var selectedItem: String?
    var position: DropdownPosition = .below
    var availableOptions: [String]
    var maxWidth: CGFloat = 180
    @State private var isDropdownVisible = false
    @SceneStorage("dropdownZIndex") private var dropdownZIndex = 1000.0
    @State private var currentZIndex = 1000.0
    
    var body: some View {
        GeometryReader{ geometry in
            let containerSize = geometry.size
            VStack(spacing: 0){
                if(position == .above && isDropdownVisible) || (position == .below && isDropdownVisible){
                    OptionsList()
                }
                HStack{
                    Text(selectedItem ?? "Choose an option")
                        .foregroundColor(selectedItem != nil ? .black : .gray)
                    Spacer()
                    Image(systemName: position == .above ? "chevron.up" : "chevron.down")
                        .font(.title3)
                        .foregroundColor(.gray)
                        .rotationEffect(.degrees(isDropdownVisible ? -180 : 0))
                }
                .padding(.horizontal, 15)
                .frame(height: 50)
                .background(Color.white)
                .contentShape(Rectangle())
                .onTapGesture {
                    dropdownZIndex += 1
                    currentZIndex = dropdownZIndex
                    withAnimation(.easeInOut){
                        isDropdownVisible.toggle()
                    }
                }
                .zIndex(10)
            }
            .clipped()
            .background(Color.white)
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
            .frame(height: containerSize.height, alignment: position == .above ? .bottom : .top)
        }
        .frame(width: maxWidth, height: 50)
        .zIndex(currentZIndex)
    }
    
    private func OptionsList() -> some View{
        VStack(spacing: 0){
            ForEach(availableOptions, id: \.self){ option in
                HStack{
                    Text(option)
                    Spacer()
                    Image(systemName: "checkmark")
                        .opacity(selectedItem == option ? 1 : 0)
                }
                .foregroundStyle(selectedItem == option ? Color.primary : Color.gray)
                .frame(height: 40)
                .contentShape(Rectangle())
                .padding(.horizontal, 15)
                .onTapGesture {
                    withAnimation(.easeInOut){
                        selectedItem = option
                        isDropdownVisible.toggle()
                    }
                }
            }
        }
        .transition(.move(edge: position == .above ? .bottom : .top))
        .zIndex(1)
    }
    
}

#Preview {
    SettingsView()
}
