//
//  BackButton.swift
//  Crewl
//
//  Created by NomoteteS on 7.02.2023.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.dismiss) var dismiss

//    var toBack : () -> Void
    var body: some View {
        ZStack {
            Button {
                dismiss()
            } label: {  }.buttonStyle(BackButtonStyle())
        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton ()
    }
}
