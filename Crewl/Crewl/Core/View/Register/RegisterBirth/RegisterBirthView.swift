//
//  RegisterBirthView.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import SwiftUI

struct RegisterBirthView: View {
    
    @StateObject var viewModel: RegisterBirthViewModel = .init()
    
    var body: some View {
        ZStack {
            Color.CrewlBackgroundColor
                .ignoresSafeArea()
            VStack {
                //MARK: RegisterBirthView - Header
                RegisterBirthHeader()
                //MARK: RegisterBirthView - Textfield
               
                .padding(.top)
                //MARK: RegisterBirthView - Error massage
                HStack {
                    Text("*")
                        .foregroundColor(.red)
                    Text("Kayıt olmak için 18 yaşından büyük olman gerekiyor.")
                        .font(.Rounded12)
                        .foregroundColor(.CrewlGray)
                    
                    Spacer()
                    
                }
                .opacity(0)
                .padding(.leading,30)
                
                Spacer()
                
                //MARK: RegisterBirthView - Button
                EntryButtonsCollected(isLoading: .constant(false),
                                      status: .constant(false)) {
                    
                } buttonAction: {
                    
                }
            }
        }
    }
}

struct RegisterBirthView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterBirthView()
    }
}


