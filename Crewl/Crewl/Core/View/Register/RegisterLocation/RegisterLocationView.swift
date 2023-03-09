//
//  RegisterLocationView.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import SwiftUI

struct RegisterLocationView: View {
    
    @StateObject var viewModel: RegisterLocationViewModel = .init()
    
    var body: some View {
        ZStack {
            Color.CrewlBackgroundColor
                .ignoresSafeArea()
            VStack {
                //MARK: RegisterLocationView - Header
                RegisterLocationHeader()
                    .padding(.top)
                
                //MARK: RegisterLocationView - Searching
                
                
                //MARK: RegisterLocationView - Map
                ZStack {
                    Circle()
                        .padding(.leading)
                }
                .padding(.all)
                .clipShape(Circle())
                
                //MARK: RegisterLocationView - SecondryButton
                SecondryButton(text: "Otomatik İşaretle", action: {
                    
                })
                .padding(.vertical)
                
                Spacer()
                
                EntryButtonsCollected(isLoading: .constant(false),
                                      status: .constant(false)) {
                    
                } buttonAction: {
                    
                }
            }
        }
    }
}

struct RegisterLocationView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterLocationView()
    }
}


