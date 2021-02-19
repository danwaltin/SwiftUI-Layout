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
		HSplitView {
			GeometryReader { _ in
				Text(character.name)
					.navigationTitle(character.name)
			}
			
			if displayedAreas.displayToolsArea {
				ToolsView(tools: tools)
			}
		}
		.toolbar {
			CharacterToolbar()
		}
	}
}


struct CharacterDetailView_Previews: PreviewProvider {
	static var previews: some View {
		CharacterDetailView(character: litterature[0], tools: allTools)
	}
}
