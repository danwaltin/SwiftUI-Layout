//
//  NoCharacterSelectedView.swift
//  SwiftUI-Layout
//
//  Created by Dan Waltin on 2021-02-13.
//

import SwiftUI

struct NoCharacterSelectedView: View {
	
	let tools: [Tool]
	
	@State var contentWidth: CGFloat = 0
	@State var toolsWidth: CGFloat = 300

	var body: some View {
		CharacterDetailWithTools(
			characterView:
				Text("Select a character in the list"),
			tools: tools
		)
    }
}

struct NoCharacterSelectedView_Previews: PreviewProvider {
    static var previews: some View {
		NoCharacterSelectedView(tools: allTools)
    }
}
