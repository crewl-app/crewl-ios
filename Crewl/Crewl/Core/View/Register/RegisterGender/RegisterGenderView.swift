//
//  RegisterGenderView.swift
//  Crewl
//
//  Created by NomoteteS on 4.03.2023.
//

import SwiftUI

struct RegisterGenderView: View {
    
    @StateObject var viewModel: RegisterGenderViewModel
    
    var body: some View {
        VStack {
                        
            HStack{
                Text("Cinsiyetin nedir?")
                    .font(.SpaceBold23)
                
                Spacer()
            }
            .padding(EdgeInsets.init(top: 30,
                                     leading: 20,
                                     bottom: 0,
                                     trailing: 0))
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack {
                    ForEach(viewModel.registerGenderItems) { item in
                        RegisterGenderPickerView(gender: item.gender,
                                                 genderImage: item.image,
                                                 isClicked: .constant(true))
                        .padding(.horizontal)
                    }
                }
            }
            .padding(.top)
            
            Spacer()
            
            EntryButtonsCollected(isLoading: .constant(false),
                                  status: .constant(false)) {
                
            } buttonAction: {
                
            }
            
        }
    }
}

struct RegisterGenderView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterGenderView(viewModel: .init(nameData: "Mert", surnameData: "Türedü"))
    }
}
