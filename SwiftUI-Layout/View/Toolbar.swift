//
//  Toolbar.swift
//  SwiftUI-Layout
//
//  Created by Dan Waltin on 2021-02-13.
//

import SwiftUI

struct Toolbar: ToolbarContent {
    var body: some ToolbarContent {
		ToolbarItemGroup(placement: .navigation) {
			Button(action: {NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)}) {
				Image(systemName: "sidebar.left")
			}
			.help("Toggle Sidebar")
		}
    }
}

