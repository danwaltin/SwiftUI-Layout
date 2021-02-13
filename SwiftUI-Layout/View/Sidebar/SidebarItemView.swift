//
//  SidebarItemView.swift
//  SwiftUI-Layout
//
//  Created by Dan Waltin on 2021-02-13.
//

import SwiftUI

struct SidebarItemView: View {
	let character: Character

	var body: some View {
		NavigationLink(
			destination: CharacterView(character: character),
			label: {
				Text(character.name).fixedSize()
			}
		)
    }
}

struct SidebarItemView_Previews: PreviewProvider {
    static var previews: some View {
		SidebarItemView(character: litterature[0])
    }
}
