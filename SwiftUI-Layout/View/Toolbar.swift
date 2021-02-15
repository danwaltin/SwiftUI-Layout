//
//  Toolbar.swift
//  SwiftUI-Layout
//
//  Created by Dan Waltin on 2021-02-13.
//

import SwiftUI

struct SidebarToolbar: ToolbarContent {
	var body: some ToolbarContent {
		ToolbarItemGroup(placement: .primaryAction) {
			Button(action: {NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)}) {
				Image(systemName: "sidebar.left")
			}
			.help("Hide or show the sidebar")
		}
	}
}

struct CharacterToolbar: ToolbarContent {
	var body: some ToolbarContent {
		ToolbarItem {
			Button(action: {
				print("*** Clicked toggle tools button.")
			}){
				Image(systemName: "sidebar.right")
			}
			.help("Hide or show the tools")
		}
	}
}
