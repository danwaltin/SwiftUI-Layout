//
//  SidebarSectionView.swift
//  SwiftUI-Layout
//
//  Created by Dan Waltin on 2021-02-13.
//

import SwiftUI

struct SidebarSectionView: View {
	let characterGroup: CharacterGroup
	
    var body: some View {
		Section(
			header: Text(characterGroup.title),
			content: {
				ForEach(characterGroup.characters) {character in
					SidebarItemView(character: character)
				}
			})
    }
}

struct SidebarSectionView_Previews: PreviewProvider {
    static var previews: some View {
		SidebarSectionView(characterGroup: CharacterGroup(title: "", characters: []))
    }
}
