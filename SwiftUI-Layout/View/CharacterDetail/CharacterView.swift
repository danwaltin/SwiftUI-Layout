//
//  CharacterDetailView.swift
//  SwiftUI-Layout
//
//  Created by Dan Waltin on 2021-02-13.
//

import SwiftUI

struct CharacterDetailView: View {
	let character: Character
	let tools: [Tool]
	
	var body: some View {
		DWSplitView(
			left: Text(character.name)
				.navigationTitle(character.name)
			 .toolbar {
				 CharacterToolbar()
			 },
			right: ToolsView(tools: tools))
	}
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
		CharacterDetailView(character: litterature[0], tools: allTools)
    }
}
