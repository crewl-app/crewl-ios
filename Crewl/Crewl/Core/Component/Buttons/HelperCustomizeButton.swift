//
//  CustomizeButton.swift
//  Crewl
//
//  Created by NomoteteS on 6.02.2023.
//

import SwiftUI

// MARK: - Set Structs

// Set CustomBlackBackground Size
struct CustomBlackBackground: View {
    var frameWidth : CGFloat
    var frameHeight : CGFloat
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color(ColorHelper.black.rawValue))
            .zIndex(0)
            .frame(width: frameWidth, height: frameHeight)
            .offset(x: 6, y: 5)
    }
}

// Set CustomButton Size and Color
struct CustomButton: View {
    /// Add New Color
    var buttonColor : Color
    var frameWidth : CGFloat
    var frameHeight : CGFloat
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .stroke(lineWidth: 2)
            .frame(width: frameWidth, height: frameHeight)
            .zIndex(1)
            .background(content: {
                buttonColor
                    .cornerRadius(10)
            })
    }
}
