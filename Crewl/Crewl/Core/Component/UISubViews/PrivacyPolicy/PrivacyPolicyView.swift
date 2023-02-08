//
//  PrivacyPolicyView.swift
//  Crewl
//
//  Created by NomoteteS on 7.02.2023.
//

import SwiftUI

struct PrivacyPolicyView: View {
    
    @ObservedObject var viewModel : PrivacyPolicyViewModel
    
    var body: some View {
        ZStack {
            PPBlackBackground()
            PPTemplate(viewModel: viewModel)
        }
        .sheet(isPresented: $viewModel.activateTerms) {
            TermsView()
        }
        .sheet(isPresented: $viewModel.activatePolicy) {
            PrivacyView()
        }
    }
}

struct PrivacyPolicyRectengle_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView(viewModel: PrivacyPolicyViewModel(checkMarked: false, activateTerms: false, activatePolicy: false))
    }
}


private struct PPTemplate: View {
    
    @StateObject var viewModel : PrivacyPolicyViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.CrewlBlack,lineWidth: 3)
                .background {   Color.CrewlWhite.cornerRadius(5)    }
            HStack(spacing: 0) {
                
                PPCheck(checkMarked: $viewModel.checkMarked)
                
                PPText(activatePolicy: $viewModel.activatePolicy, activateTerms: $viewModel.activateTerms)
            }
            .padding(.all,2)
                
        }
        .frame(width: UIScreen.main.bounds.width * 0.85,
               height: UIScreen.main.bounds.height * 0.09)
        .offset(x: viewModel.checkMarked ? 4 : 0,
                y: viewModel.checkMarked ? 4 : 0)
        
            
        
    }
}

// MARK: - Black Background
private struct PPBlackBackground: View{
    var body: some View {
        RoundedRectangle(cornerRadius: 5 )
            .foregroundColor(Color.CrewlBlack)
            .frame(width: UIScreen.main.bounds.width * 0.85,
                   height: UIScreen.main.bounds.height * 0.09)
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
