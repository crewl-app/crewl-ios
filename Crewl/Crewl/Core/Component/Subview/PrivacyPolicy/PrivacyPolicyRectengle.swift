//
//  PrivacyPolicyView.swift
//  Crewl
//
//  Created by NomoteteS on 7.02.2023.
//

import SwiftUI

struct PrivacyPolicyView: View {
    
    var body: some View {
        ZStack {
            PPBlackBackGround()
            PPTemplate()
        }
    }
}

struct PrivacyPolicyRectengle_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView()
    }
}


struct PPTemplate: View {
    
    @StateObject var viewModel : PrivacyPolicyViewModel = .init(checkMarked: false)
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.CrewlBlack,lineWidth: 3)
                .background {   Color.CrewlWhite.cornerRadius(5)    }
            HStack(spacing: 0) {
                
                PPCheck(checkMarked: $viewModel.checkMarked)
                
                PPText()
            }
            .padding(.all,2)
                
        }
        .frame(width: UIScreen.main.bounds.width * 0.85,
               height: UIScreen.main.bounds.height * 0.09)
        .offset(x: viewModel.checkMarked ? 4 : 0,
                y: viewModel.checkMarked ? 4 : 0)
            
        
    }
}

struct PPBlackBackGround: View{
    var body: some View {
        RoundedRectangle(cornerRadius: 5 )
            .foregroundColor(Color.CrewlBlack)
            .frame(width: UIScreen.main.bounds.width * 0.85,
                   height: UIScreen.main.bounds.height * 0.09)
            .offset(x: 4,
                    y: 4)
    }
}

struct PPText: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 3) {
                Text("Kullanım Koşulları")
                    .font(.RoundedBold11)
                    .onTapGesture {
                        // Activate
                    }
                Text("ve")
                Text("Güvenlik Sözleşmesi")
                    .font(.RoundedBold11)
                    .onTapGesture {
                        // Activate
                    }
                Text("'ni")
            }
            Text("okudum ve kabul ediyorum.")
        }
        .font(.RoundedRegular12)
        .frame(width: UIScreen.main.bounds.width * 0.69,
               height: UIScreen.main.bounds.height * 0.06)
    }
}

// MARK: - Checkmark rectengle
private struct PPCheck: View {
    @Binding var checkMarked : Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .stroke(lineWidth: 2)
                .frame(width: UIScreen.main.bounds.width * 0.059,
                       height: UIScreen.main.bounds.height * 0.036)
            Image(systemName: "checkmark")
                .font(.system(size: 13, weight: .semibold))
                .opacity(checkMarked ? 1 : 0)
        }
        .frame(width: UIScreen.main.bounds.width * 0.15,
               height: UIScreen.main.bounds.height * 0.076)
        .onTapGesture {
            checkMarked.toggle()
        }
    }
}
