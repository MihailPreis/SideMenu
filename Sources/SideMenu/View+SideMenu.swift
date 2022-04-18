//
//  View+SideMenu.swift
//  SideMenu
//
//  Created by Mike Price on 18.04.2022.
//

import SwiftUI

public extension View {
	/**
	 Initialize SideMenu view.

	 - Parameter isShow: Binding of show flag.
	 - Parameter threshold: Auto-hide zone (0.0-1.0).
	 - Parameter animationSpeed: This is what you were thinking.
	 - Parameter menuContent: Menu content view.
	 */
	func sideMenu<MenuContent: View>(
		isShow: Binding<Bool>,
		threshold: CGFloat = 0.5,
		animationSpeed: Double = 2,
		@ViewBuilder menuContent: () -> MenuContent
	) -> some View {
		SideMenu(isShow: isShow, threshold: threshold, animationSpeed: animationSpeed) {
			menuContent()
		} rootContent: {
			self
		}
	}
}
