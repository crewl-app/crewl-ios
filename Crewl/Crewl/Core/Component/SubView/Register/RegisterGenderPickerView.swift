//
//  RegisterGenderPickerView.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import SwiftUI

struct RegisterGenderPickerView: View {
    
    var genderName: String
    var genderImage: String
    var isClicked: Bool
    
    var body: some View {
        ZStack {
            VStack {
                    Image(genderImage)
                        .resizable()
                        .clipShape(Rectangle())
                        .frame(width: 170,
                               height: 180)
                HStack {
                    Image(systemName: isClicked ? "checkmark.circle.fill" : "circle")
                    Text(genderName)
                        .font(.Rounded16.bold())
                }
                .padding(EdgeInsets.init(top: isClicked ? 30 : 20,
                                         leading: isClicked ? 15 : 0,
                                         bottom: isClicked ? 20 : 10,
                                         trailing: isClicked ? 15 : 0))
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
    }
}

struct RegisterGenderPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.CrewlBackgroundColor
                .ignoresSafeArea()
            RegisterGenderPickerView(genderName: "",
                                     genderImage: "",
                                     isClicked: false)
        }
    }
}
