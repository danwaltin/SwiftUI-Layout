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
	@State var toolsWidth: CGFloat = 0
	
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
			
			VStack {
				HSplitView {
					GeometryReader { g in
						NoCharacterSelectedView()
					}
					.border(Color.green, width: 1)
					.bindGeometry(to: $contentWidth) {$0.size.width}

					GeometryReader { g in
						ToolsView(tools: tools)
					}
					.border(Color.blue, width: 1)
					.bindGeometry(to: $toolsWidth) {$0.size.width}
				}
				HStack {
					Text("Debug info: contentWidth: \(contentWidth), toolsWidth: \(toolsWidth)")
					Spacer()
				}
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
