//
//  PhoneTextField.swift
//  Crewl
//
//  Created by NomoteteS on 8.02.2023.
//

import SwiftUI

struct PhoneTextField: View {
    
    @Binding var number : String
    @State var tab = false
    
    
    var body: some View {
        ZStack {
            
            let status = (tab || number.count > 0)
            phoneBackground(status: .constant(status))
                
            TextField("", text: $number.limit(15) )
                .onChange(of: number, perform: { oldValue in
                               number = format(with: "(XXX) XXX-XXXX", phone: oldValue)
                           })
                .keyboardType(.numberPad)
                .frame(width: 210,
                       height: 40)
        }
        .onTapGesture {
            tab = true
        }
    }
}

struct CustomPhoneTextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.CrewlBackgroundColor
                .ignoresSafeArea()
            PhoneTextField(number: .constant(""))
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
                        .padding(.top,3)
                        .padding(.trailing,10)
                    Spacer()
                }
                .opacity(status ? 0 : 1)
                .padding(.trailing,100)
                .font(.Rounded12)
                .foregroundColor(Color.CrewlGray)
                
            }.frame(width: 250,
                 height: 50)
    }
}
