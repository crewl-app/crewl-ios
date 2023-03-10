//
//  ResendCodeView.swift
//  Crewl
//
//  Created by NomoteteS on 9.02.2023.
//

import SwiftUI

struct ResendCodeView: View {
    @State var count = 60
    @State var launchTimer = true
    var action : () -> Void

    var body: some View {
        HStack {
            // Send code button
            Button {
                action()
                if count == 0 && launchTimer == false {
                    launchTimer = true
                    count = 60
                    startTimer()
                }
            } label: {
                Text("Kodu Yeniden Gönder")
                    .font(.Rounded13.bold())
                    .foregroundColor(Color(count == 0 ? ColorHelper.black.rawValue : ColorHelper.lightGray.rawValue))
            }
            .disabled(launchTimer)
            
            Spacer()
            
            // Count Circle
            ZStack {
                Circle()
                    .frame(width: 30)
                    .foregroundColor(Color(count == 0 ? ColorHelper.green.rawValue : ColorHelper.black.rawValue))
                
                Text("\(count)")
					.font(.Rounded12.bold())
                    .foregroundColor(Color(count == 0 ? ColorHelper.white.rawValue : ColorHelper.yellow.rawValue))
            }
        }
        .padding(.horizontal)
        .onAppear{ startTimer() }
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if count > 0  {
                count -= 1
            } else {
                launchTimer = false
                timer.invalidate()
            }
        }
    }
}

struct ReSendCode_Previews: PreviewProvider {
    static var previews: some View {
		ResendCodeView() {}
    }
}
