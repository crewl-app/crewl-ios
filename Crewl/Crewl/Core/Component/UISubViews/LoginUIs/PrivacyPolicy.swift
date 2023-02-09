//
//  PrivacyPolicyView.swift
//  Crewl
//
//  Created by NomoteteS on 7.02.2023.
//

import SwiftUI

struct PrivacyPolicy: View {
    
    @Binding var checkMarked : Bool
    @Binding var activatePolicy : Bool
    @Binding var activateTerms : Bool
    
    var body: some View {

        ZStack {
            PPBlackBackground()
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.CrewlBlack,lineWidth: 3)
                .background {   Color.CrewlWhite.cornerRadius(5)    }
            HStack(spacing: 0) {
                
                PPCheck(checkMarked: $checkMarked)
                PPText(activatePolicy: $activatePolicy, activateTerms: $activateTerms)
            }
            .padding(.all,2)
        }
        .frame(width: 302,
               height: 51)
        .offset(x: checkMarked ? 4 : 0,
                y: checkMarked ? 4 : 0)

    }
}

struct PrivacyPolicyRectengle_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicy(checkMarked: .constant(false), activatePolicy: .constant(false), activateTerms: .constant(false))
    }
}

// MARK: - Black Background
private struct PPBlackBackground: View{
    var body: some View {
        RoundedRectangle(cornerRadius: 5 )
            .foregroundColor(Color.CrewlBlack)
            .offset(x: 4,
                    y: 4)
    }
}

// MARK: - Text
private struct PPText: View {
    
    @Binding var activatePolicy : Bool
    @Binding var activateTerms : Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 3) {
                Text("Kullanım Koşulları")
                    .font(.RoundedBold11)
                    .onTapGesture {
                        activateTerms.toggle()
                    }
                Text("ve")
                Text("Güvenlik Sözleşmesi")
                    .font(.RoundedBold11)
                    .onTapGesture {
                        activatePolicy.toggle()
                    }
                Text("'ni")
            }
            Text("okudum ve kabul ediyorum.")
        }
        .font(.RoundedRegular12)
        .frame(width: 265,
               height: 50)
    }
}

// MARK: - Checkmark rectengle
private struct PPCheck: View {
    @Binding var checkMarked : Bool
    
    var body: some View {
        ZStack {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 2)
                    .frame(width: 20,
                           height: 20)
                Image(systemName: "checkmark")
                    .font(.system(size: 13, weight: .semibold))
                    .opacity(checkMarked ? 1 : 0)
            }
            .padding()
            .frame(width: 40, height: 40)
        }
        .padding(.leading)
        .onTapGesture {
            checkMarked.toggle()
        }
    }
}

// MARK: - TermsOfUseView View
private struct TermsView : View {
    var body: some View {
        ZStack {
            Color(ColorHelper.white.rawValue)
                .ignoresSafeArea()
            VStack {
                tabRectangle()
                    .padding(.top)
                Spacer()
                smileRectangle()
                
                Text(TextHelper.TermsService.TermsOfUser.rawValue.locale())
                    .padding()
                    .font(.SpaceBold20)
                Text(TextHelper.TermsService.TermsOfUseDescription.rawValue.locale())
                    .font(.RoundedLight14)
                    .padding(.horizontal)
                Spacer()
            }.multilineTextAlignment(.center)
        }
    }
}

// MARK: - PrivacyPolicy View

private struct PrivacyView : View {
    var body: some View {
        ZStack {
            Color.CrewlWhite
                .ignoresSafeArea()
            VStack {
                tabRectangle()
                    .padding(.top)
                    .padding()
                Spacer()
                smileRectangle()
                Text(TextHelper.TermsService.PrivacyPolicy.rawValue.locale())
                    .padding()
                    .font(.SpaceBold20)
                Text(TextHelper.TermsService.PrivacyPolicyDescription.rawValue.locale())
                    .font(.RoundedLight14)
                    .padding(.horizontal)
                Spacer()
            }.multilineTextAlignment(.center)
        }
    }
}

private struct tabRectangle: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .frame(width: 44, height: 4)
            .foregroundColor(Color.CrewlGray)
    }
}

private struct smileRectangle: View {
    var body: some View {
        Text("😀")
            .font(.system(size: 32))
            .background(
                RoundedRectangle(cornerRadius: 11)
                    .foregroundColor(Color.CrewlWhitePink)
                    .frame(width: 80, height: 80)
            )
    }
}
