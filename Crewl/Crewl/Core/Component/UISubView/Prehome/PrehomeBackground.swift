//
//  PrehomeBackground.swift
//  Crewl
//
//  Created by NomoteteS on 18.02.2023.
//

import SwiftUI

struct PrehomeBackground: View {
    var body: some View {
        VStack {
            if WindowUtils.windowType == WindowType.Small {
                PreHomeBackgroundImage(imageSize: CGSize(width: 1.dW(),
                                                         height: 0.95.dH()))
                .offset(y: -0.05.dH())
            } else {
                PreHomeBackgroundImage(imageSize: CGSize(width: 1.dW(),
                                                         height: 1.dH()))
                .offset(y: 0.04.dH())
            }
        }
    }
}

struct PrehomeBackground_Previews: PreviewProvider {
    static var previews: some View {
        PrehomeBackground()
    }
}

private struct PreHomeBackgroundImage : View {
    var imageSize: CGSize = CGSize()
    
    var body: some View {
        Image.preHomeImage
            .resizable()
            .frame(width:  imageSize.width,
                   height: imageSize.height)
    }
}
