//
//  SidebarItemView.swift
//  SwiftUI-Layout
//
//  Created by Dan Waltin on 2021-02-13.
//

import SwiftUI

struct SidebarItemView: View {
	let character: Character
	let tools: [Tool]
	var body: some View {
			NavigationLink(
			destination: CharacterDetailView(character: character, tools: tools),
			label: {
				Text(character.name).fixedSize()
			}
		)
    }
}

struct SidebarItemView_Previews: PreviewProvider {
    static var previews: some View {
		SidebarItemView(character: litterature[0], tools: allTools)
    }
}
