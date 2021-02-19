//
//  DisplayedAreas.swift
//  SwiftUI-Layout
//
//  Created by Dan Waltin on 2021-02-14.
//

import Foundation

class DisplayedAreas: ObservableObject {
	@Published var displayToolsArea = true
	@Published var toolsAreaWidth: CGFloat = 300
}
