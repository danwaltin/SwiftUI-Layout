//
//  CharacterView.swift
//  SwiftUI-Layout
//
//  Created by Dan Waltin on 2021-02-13.
//

import SwiftUI

struct CharacterView: View {
	let character: Character
	
    var body: some View {
		Text(character.name)
			.navigationTitle(character.name)
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
		CharacterView(character: litterature[0])
    }
}
