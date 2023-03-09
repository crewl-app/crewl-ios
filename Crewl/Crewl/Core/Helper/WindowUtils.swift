//
//  WindowUtils.swift
//  Crewl
//
//  Created by NomoteteS on 18.02.2023.
//

import Foundation

class WindowUtils {
  static var screenSize: CGSize = CGSize()
    static var windowType = getWindowType()
    
    static var dimensions: any Dimension = DefaultDimensions()

    private static func getWindowType() -> WindowType {
        var windowType: WindowType = WindowType.Default
        
        if screenSize.height < 680 {
            dimensions = SmallDimensions()
            windowType = WindowType.Small
        }

        return windowType
    }
}

enum WindowType {
    case Small, Default
}

protocol Dimension {
    associatedtype OnboardingItem: RawRepresentable
    associatedtype OnboardingScreen: RawRepresentable
}

class SmallDimensions: Dimension {
    enum OnboardingItem: Float {
        case VStackPadding = 0
    }

  enum OnboardingScreen: Float {
      case VStackPadding = 0
  }
}

class DefaultDimensions: Dimension {
    enum OnboardingItem: Float {
        case VStackPadding = 0
    }

  enum OnboardingScreen: Float {
      case VStackPadding = 0
  }
}
// TODO: Edit WindowUtils.
/*
 class WindowUtils {
	 var screenWidth: CGFloat
	 var screenHeight: CGFloat
	 var screenSize: CGFloat

	 static var windowType: WindowType = WindowType.Default

	 init() {
		 self.screenWidth = UIScreen.main.bounds.width
		 self.screenHeight = UIScreen.main.bounds.height

		 screenSize = sqrt(pow(self.screenWidth, 2) + pow(self.screenHeight, 2))

		 WindowUtils.windowType = getWindowType()
	 }

	 static var dimensions: DimensionsProtocol = DefaultDimensions()


	 private func getWindowType() -> WindowType {
		 var windowType: WindowType = WindowType.Default

		 if screenSize < 680.0 {
			 windowType = WindowType.Small
		 }

		 return windowType
	 }

	 private func setDimensions() {
		 if screenSize <= 568.0 { // 4.0 inches or smaller (iPhone SE)
			 WindowUtils.dimensions = SmallDimensions()
		 }
	 }
 }

 enum WindowType {
	 case Small, Default
 }

 protocol DimensionsProtocol {
	 var size: Float { get }
 }

 class SmallDimensions: DimensionsProtocol {
	 var size: Float = 4.0
 }

 class DefaultDimensions: DimensionsProtocol {
	 var size: Float = 5.5
 }

 */
