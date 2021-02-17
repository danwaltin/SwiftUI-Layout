//
//  SidebarSectionView.swift
//  SwiftUI-Layout
//
//  Created by Dan Waltin on 2021-02-13.
//

import SwiftUI

struct SidebarSectionView: View {
	let characterGroup: CharacterGroup
	let tools: [Tool]
	
    var body: some View {
		Section(
			header: Text(characterGroup.title),
			content: {
				ForEach(characterGroup.characters) {
					SidebarItemView(character: $0, tools: tools)
				}
			}
		)
    }
}

struct SidebarSectionView_Previews: PreviewProvider {
    static var previews: some View {
		SidebarSectionView(characterGroup: litteratureGroup, tools: allTools)
    }
}
