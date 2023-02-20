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
            PPBlackBackground(size: CGSize(width: 0.84.dW(),
                                           height: 50))
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.CrewlBlack,lineWidth: 2)
                    .frame(width: 0.84.dW(),
                           height: 50)
                    .background {   Color.CrewlWhite.cornerRadius(5)
                        .frame(width: 0.84.dW(),
                               height: 50)}
                HStack(spacing: 0) {
                    PPCheck(checkMarked: $isCheckMarked)
                        .frame(width: 0.05.dW())
                        .padding()
                    PPText(activatePolicy: $isActivatePolicy, activateTerms: $isActivateTerms)
                        .frame(width: 0.7.dW())
                        .fixedSize(horizontal: true, vertical: true)
                    Spacer()
                }
                .frame(width: 0.82.dW())
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

// MARK: - Privacy Policy Black Background
private struct PPBlackBackground: View{
    var size : CGSize
    var body: some View {
        RoundedRectangle(cornerRadius: 5 )
            .foregroundColor(Color.CrewlBlack)
            .frame(width: size.width,
                   height: size.height)
            .offset(x: 4,
                    y: 4)
    }
}

// MARK: - Privacy Policy Text
private struct PPText: View {
    
    @Binding var activatePolicy : Bool
    @Binding var activateTerms : Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack(spacing: 2) {
                    Text("Kullanım Koşulları")
                        .font(.Rounded10.weight(.semibold))
                        
                        .onTapGesture {
                            activateTerms.toggle()
                        }
                    Text("ve")
                    Text("Güvenlik Sözleşmesi")
                        .font(.Rounded10.weight(.semibold))
                        .onTapGesture {
                            activatePolicy.toggle()
                        }
                    Text("'ni")
                }
                Text("okudum ve kabul ediyorum.")
            }
            .font(.Rounded10)
            .lineLimit(1)
            .padding(.trailing)
            Spacer()
        }
    }
}

// MARK: - Privacy Policy Checkmark rectengle
private struct PPCheck: View {
    
    @Binding var checkMarked : Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.CrewlWhite)
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 2)
                    .frame(width: 20,
                           height: 20)
                Image(systemName: "checkmark")
                    .font(.system(size: 13, weight: .semibold))
                    .opacity(checkMarked ? 1 : 0)
            }
            .frame(width: 0.05.dW())
        }

        .onTapGesture {
            checkMarked.toggle()
        }
    }
}

// MARK: - Privacy Policy TermsOfUseView View
private struct TermsView : View {
    var body: some View {
        ZStack {
            Color.CrewlBackgroundColor
                .ignoresSafeArea()
            VStack {
                tabRectangle()
                    .padding(.top)
                Spacer()
                Image.TermsOfService
                    .resizable()
                    .frame(width: 248, height: 178)
                Text(TextHelper.TermsService.TermsOfUser.rawValue.locale())
                    .padding()
                    .font(.SpaceBold20)
                Text(TextHelper.TermsService.TermsOfUseDescription.rawValue.locale())
                    .font(.Rounded13)
                    .padding(.horizontal)
                Spacer()
            }.multilineTextAlignment(.center)
        }
    }
}

// MARK: - Privacy Policy PrivacyPolicy View

private struct PrivacyView : View {
    var body: some View {
        ZStack {
            Color.CrewlBackgroundColor
                .ignoresSafeArea()
            VStack {
                tabRectangle()
                    .padding(.top)
                    .padding()
                Spacer()
                Image.PrivacyPolicy
                    .resizable()
                    .frame(width: 248, height: 174)
                Text(TextHelper.TermsService.PrivacyPolicy.rawValue.locale())
                    .padding()
                    .font(.SpaceBold20)
                Text(TextHelper.TermsService.PrivacyPolicyDescription.rawValue.locale())
                    .font(.Rounded13)
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

