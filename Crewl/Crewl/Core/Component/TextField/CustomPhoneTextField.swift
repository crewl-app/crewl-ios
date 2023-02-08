//
//  CustomPhoneTextField.swift
//  Crewl
//
//  Created by NomoteteS on 8.02.2023.
//

import SwiftUI

struct CustomPhoneTextField: View {
    @StateObject var model : LoginPropertys = .init()
    @StateObject var viewModel : TextFieldViewModel = .init()
    
    
    var body: some View {
        ZStack {
            phoneBackground(status: $viewModel.tab)
                
            TextField("", text: $model.userPhone.limit(10))
                .keyboardType(.numberPad)
                .frame(width: 210)
            
        }
        .onTapGesture {
            viewModel.tab.toggle()
        }
    }
}

struct CustomPhoneTextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.BackgroundColor
                .ignoresSafeArea()
            CustomPhoneTextField()
        }
    }
}

private struct phoneBackground: View {
    
    @Binding var status : Bool
    
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .foregroundColor(Color.CrewlWhite)
                
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(status ? Color.CrewlYellow : Color.CrewlWhiteGray)
                    .frame(height: 1)
                    .offset(y:25.5)
                
                VStack(alignment: .leading) {
                    Text("Telefon Numarası")
                    
                    Text("(5xx) xxx-xx-xx")
                }
                .opacity(status ? 0 : 1)
                .padding(.trailing,100)
                .font(.RoundedRegular14)
                .foregroundColor(Color.CrewlGray)
                
            }.frame(width: 250,
                 height: 50)
    }
}
