//
//  ReSendCode.swift
//  Crewl
//
//  Created by NomoteteS on 9.02.2023.
//

import SwiftUI

struct ReSendCode: View {
    @State var count = 60
    @Binding var launchTimer : Bool
    var action : () -> Void
    var body: some View {
        HStack {
            // Send code button
            Button {
                action()
                if count == 0 || launchTimer == false {
                    launchTimer.toggle()
                    count = 60
                    startTimer()
                }
            } label: {
                Text("Kodu Yeniden gönder")
                    .font(.RoundedBold12)
                    .foregroundColor(Color(count == 0 ? ColorHelper.black.rawValue : ColorHelper.gray.rawValue))
            }
            
            Spacer()
            
            // Count Circle
            ZStack {
                Circle()
                    .frame(width: 27)
                    .foregroundColor(Color(count == 0 ? ColorHelper.green.rawValue : ColorHelper.black.rawValue))
                
                Text("\(count)")
                    .font(.RoundedBold11)
                    .foregroundColor(Color(count == 0 ? ColorHelper.white.rawValue : ColorHelper.yellow.rawValue))
            }
        }.padding(.horizontal)
            .onAppear{
                startTimer()
            }
    }
    
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if count > 0  {
                count -= 1
            }else {
                launchTimer = false
                timer.invalidate()
            }
        }
    }
}

struct ReSendCode_Previews: PreviewProvider {
    static var previews: some View {
        ReSendCode(launchTimer: .constant(false)) {
            
        }
    }
}
