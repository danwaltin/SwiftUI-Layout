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
	
	@State var contentWidth: CGFloat = 0
	@State var toolsWidth: CGFloat = 300
	
	var body: some View {
		NavigationView {
			List {
				ForEach(groups) {
					SidebarSectionView(characterGroup: $0, tools: tools)
				}
			}
			.listStyle(SidebarListStyle())
			.toolbar{
				SidebarToolbar()
			}
			
			NoCharacterSelectedView(tools: tools)
		}
		.environmentObject(displayedAreas)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView(groups: allGroups, tools: allTools)
	}
}
