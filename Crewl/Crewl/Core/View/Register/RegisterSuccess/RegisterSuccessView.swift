//
//  RegisterSuccessView.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import SwiftUI

struct RegisterSuccessView: View {
    var body: some View {
        ZStack {
            Color.CrewlBackgroundColor
                .ignoresSafeArea()
            VStack {
                EntryButtonsCollected(isLoading: .constant(false),
                                      status: .constant(false)) {
                    
                } buttonAction: {
                    
                }
            }
        }
    }
}

struct RegisterSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterSuccessView()
    }
}
