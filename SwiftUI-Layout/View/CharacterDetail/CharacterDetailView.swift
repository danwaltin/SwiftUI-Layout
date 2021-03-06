//
//  CharacterDetailView.swift
//  SwiftUI-Layout
//
//  Created by Dan Waltin on 2021-02-13.
//

import SwiftUI

struct CharacterDetailView: View {
	@EnvironmentObject var displayedAreas: DisplayedAreas
	
	let character: Character
	let tools: [Tool]
	
	var body: some View {
		HStack {
			GeometryReader { _ in
				Text(character.name)
					.navigationTitle(character.name)
			}
			.frame(minWidth: 100)
			
			ToolsView(tools: tools)
				.frame(width: displayedAreas.displayToolsArea ? displayedAreas.toolsAreaWidth : 0)
		}
		.toolbar {
			CharacterToolbar()
		}
	}
}


struct CharacterDetailView_Previews: PreviewProvider {
	static var previews: some View {
		CharacterDetailView(character: litterature[0], tools: allTools)
			.environmentObject(DisplayedAreas())
	}
}
