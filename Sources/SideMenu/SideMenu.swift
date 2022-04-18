//
//  SideMenu.swift
//  SideMenu
//
//  Created by Mike Price on 18.04.2022.
//

import SwiftUI

struct SideMenu<MenuContent: View, RootContent: View>: View {

	@State private var menuWidth: CGFloat = 0
	@State private var menuOffset: CGFloat = 0

	@Binding var isShow: Bool
	var threshold: CGFloat = 0.5
	var animationSpeed: Double = 2
	@ViewBuilder let menuContent: MenuContent
	@ViewBuilder let rootContent: RootContent

	var body: some View {
		ZStack(alignment: .leading) {
			menuContent
				.getSize { size in
					menuWidth = size.width
					menuOffset = menuWidth
				}
				.offset(x: -menuWidth + menuOffset, y: 0)
				.animation(.easeInOut.speed(animationSpeed), value: menuOffset)

			rootContent
				.opacity(isShow ? 0.75 : 1)
				.background(.black)
				.offset(x: isShow ? menuOffset : 0, y: 0)
				.animation(.easeInOut.speed(animationSpeed), value: menuOffset)
				.animation(.easeInOut.speed(animationSpeed), value: isShow)
				.disabled(isShow)
		}
		.onChange(of: menuOffset) { newValue in
			guard newValue == .zero else { return }
			isShow = false
		}
		.onChange(of: isShow) { newValue in
			guard newValue else { return }
			menuOffset = menuWidth
		}
		.gesture(
			DragGesture()
				.onChanged { value in
					guard isShow else { return }
					menuOffset = min(max(value.location.x, .zero), menuWidth)
				}
				.onEnded { _ in
					guard isShow else { return }
					if menuOffset < menuWidth * threshold {
						menuOffset = .zero
					} else {
						menuOffset = menuWidth
					}
				}
		)
	}

}

struct SideMenu_Previews: PreviewProvider {
	static var previews: some View {
		_SideMenu()
	}

	struct _SideMenu: View {
		@State var showSideMenu: Bool = false

		var body: some View {
			Color.blue
				.ignoresSafeArea()
				.overlay {
					Button("Open SideMenu") {
						showSideMenu = true
					}
					.foregroundColor(.white)
					.padding()
				}
				.sideMenu(isShow: $showSideMenu) {
					Color.red
						.ignoresSafeArea()
						.frame(width: 200)
				}
		}
	}
}
