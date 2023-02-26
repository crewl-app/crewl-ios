//
//  UIViewController+Extension.swift
//  Crewl
//
//  Created by Kaan on 26.02.2023.
//

import Foundation
import UIKit

extension UIViewController {
  func screen() -> UIScreen? {
	var parent = self.parent
	var lastParent = parent

	while parent != nil {
	  lastParent = parent
	  parent = parent!.parent
	}

	return lastParent?.view.window?.windowScene?.screen
  }
}
