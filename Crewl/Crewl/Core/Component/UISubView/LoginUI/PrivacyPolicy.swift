//
//  PrivacyPolicyView.swift
//  Crewl
//
//  Created by NomoteteS on 7.02.2023.
//

import SwiftUI

struct PrivacyPolicy: View {
    @Binding var isCheckMarked : Bool
    @Binding var isActivatePolicy : Bool
    @Binding var isActivateTerms : Bool
    
    var body: some View {

        ZStack {
            PPBlackBackground()
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.CrewlBlack,lineWidth: 3)
                    .background {   Color.CrewlWhite.cornerRadius(5)    }
                HStack(spacing: 0) {
                    
                    PPCheck(checkMarked: $isCheckMarked)
                    PPText(activatePolicy: $isActivatePolicy, activateTerms: $isActivateTerms)
                }
                .padding(.all,2)
            }
            .offset(x: isCheckMarked ? 4 : 0,
                y: isCheckMarked ? 4 : 0)
        }
        .frame(width: 302,
               height: 51)
        .sheet(isPresented: $isActivateTerms, content: {
            TermsView()
        })
        .sheet(isPresented: $isActivatePolicy, content: {
            PrivacyView()
        })
        
    }
}

struct PrivacyPolicyRectengle_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicy(isCheckMarked: .constant(false), isActivatePolicy: .constant(false), isActivateTerms: .constant(false))
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
                Image.TermsOfService
                    .resizable()
                    .frame(width: 248, height: 74)
                
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
                Image.PrivacyPolicy
                    .resizable()
                    .frame(width: 248, height: 74)
                
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

