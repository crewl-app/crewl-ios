//
//  RegisterGenderPickerView.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import SwiftUI

struct RegisterGenderPickerView: View {
    
    var gender: String
    var genderImage: Image
    @Binding var isClicked: Bool
    
    var body: some View {
        ZStack {
            
            VStack {
                    genderImage
                        .resizable()
                        .clipShape(Rectangle())
                        .frame(width: 170,
                               height: 180)
                HStack {
                    Image(systemName: isClicked ? "checkmark.circle.fill" : "circle")
                    Text(gender)
                        .font(.Rounded16.bold())
                }
                .padding(EdgeInsets.init(top: 19,
                                         leading: 0,
                                         bottom: 13,
                                         trailing: 0))
            }
            .padding(.all)
            .background {
                ZStack {
                    RoundedRectangle(cornerRadius: 10 )
                        .stroke(Color.CrewlBlack,lineWidth: 2)
                }
                .background {
                    if isClicked {
                        Color.CrewlYellow
                    }
                }
            }
            
        }
        .onTapGesture {
            isClicked.toggle()
        }
    }
}

struct RegisterGenderPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.CrewlBackgroundColor
                .ignoresSafeArea()
            RegisterGenderPickerView(gender: "",
                                     genderImage: Image(""),
                                     isClicked: .constant(false))
        }
    }
}
