//
//  View+Size.swift
//  SideMenu
//
//  Created by Mike Price on 18.04.2022.
//

import SwiftUI

extension View {
	func getSize(result: @escaping (CGSize) -> Void) -> some View {
		self
			.modifier(GetSizeModifier())
			.onPreferenceChange(SizePreferenceKey.self, perform: result)
	}
}

private struct GetSizeModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.background(GeometryReader { g in
				Color.clear
					.preference(key: SizePreferenceKey.self, value: g.size)
			})
	}
}

private struct SizePreferenceKey: PreferenceKey {
	static var defaultValue: CGSize = .zero

	static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
		value = nextValue()
	}
}
