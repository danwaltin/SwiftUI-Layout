//
//  ContentView.swift
//  SwiftUI-Layout
//
//  Created by Dan Waltin on 2021-02-13.
//

import SwiftUI

struct ContentView: View {
	let groups: [CharacterGroup]
	let tools: [Tool]
	
	@StateObject var displayedAreas = DisplayedAreas()
	
	var body: some View {
		NavigationView {
			List {
				ForEach(groups) {
					SidebarSectionView(characterGroup: $0)
				}
			}
			.listStyle(SidebarListStyle())
			.toolbar{
				SidebarToolbar()
			}
			
			GeometryReader { geometry in
						HSplitView {
							VStack {
								GeometryReader { g in
									NoCharacterSelectedView()
										.frame(height: geometry.size.height)
								}
							}
							VStack {
								GeometryReader { g in
									if displayedAreas.displayToolsArea {
										ToolsView(tools: tools)
											.frame(height: geometry.size.height)
									} else {
										ToolsView(tools: tools)
											.frame(width: 0, height: geometry.size.height)
									}
								}
							}
						}
						.frame(width: geometry.size.width, height: geometry.size.height)
			}
		}
		.environmentObject(displayedAreas)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView(groups: allGroups, tools: allTools)
    }
}
