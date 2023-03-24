//
//  ButtonsCollected.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import SwiftUI

struct EntryButtonsCollected: View {
    
    @Environment(\.dismiss) var Dismiss
    @Binding var isLoading : Bool
    @Binding var status : Bool
    var backAction: () -> ()
    var buttonAction: () -> ()
    
    var body: some View {
        HStack(spacing: 20) {
            BackButton {
                backAction()
                Dismiss()
            }
            let status = (status)
            ZStack {
                PrimaryButton(text: "Onayla", isLoading: $isLoading) {
                    buttonAction()
                }
                .disabled(status != true)
                .compositingGroup()
                .opacity(status ? 1 : 0.5)
            }
        }
    }
}

struct EntryButtonsCollected_Previews: PreviewProvider {
    static var previews: some View {
        EntryButtonsCollected(isLoading: .constant(false), status: .constant(false))
        {
            
        } buttonAction: {
            
        }

    }
}
