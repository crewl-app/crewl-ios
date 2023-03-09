//
//  NotiButtonCollected.swift
//  Crewl
//
//  Created by NomoteteS on 7.03.2023.
//

import SwiftUI

struct NotiButtonCollected: View {
    
    var laterAction : () -> ()
    var allowAction : () -> ()
    
    var body: some View {
        HStack {
            
            Spacer()
            
            NotiButton(isColorChange: true, text: "Daha Sonra") {
                laterAction()
            }
            
            Spacer()
            
            NotiButton(isColorChange: false, text: "İzin Ver") {
                allowAction()
            }
            
            Spacer()
        }
    }
}

struct NotiButtonCollected_Previews: PreviewProvider {
    static var previews: some View {
        NotiButtonCollected {
            
        } allowAction: {
            
        }

    }
}
