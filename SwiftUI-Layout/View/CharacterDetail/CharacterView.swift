//
//  CharacterDetailView.swift
//  SwiftUI-Layout
//
//  Created by Dan Waltin on 2021-02-13.
//

import SwiftUI

struct CharacterDetailView: View {
	let character: Character

	var body: some View {
		Text(character.name)
			.navigationTitle(character.name)
			.toolbar {
				CharacterToolbar()
			}
	}
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
		CharacterDetailView(character: litterature[0])
    }
}
