//
//  CharacterDetailView.swift
//  SwiftUI-Layout
//
//  Created by Dan Waltin on 2021-02-13.
//

import SwiftUI

struct CharacterDetailWithTools<V>: View where V:View {
	let characterView: V
	let tools: [Tool]
	
	@State var contentWidth: CGFloat = 0
	@State var toolsWidth: CGFloat = 300
	
	var body: some View {
		//VStack {
			DWSplitView(
				left:
					GeometryReader { _ in
						characterView
					}
					.bindGeometry(to: $contentWidth) {$0.size.width}
					.toolbar {
						CharacterToolbar()
					},
				right:
					ToolsView(tools: tools)
					.bindGeometry(to: $toolsWidth) { $0.size.width},
				rightWidth: toolsWidth)
		//	Text("DebugInfo: contentWidth: \(contentWidth) | toolsWidth: //\(toolsWidth)")
		//}
	}
}
struct CharacterDetailView: View {
	let character: Character
	let tools: [Tool]
	
	@State var contentWidth: CGFloat = 0
	@State var toolsWidth: CGFloat = 200
	
	var body: some View {
		CharacterDetailWithTools(
			characterView:
				Text(character.name)
				.navigationTitle(character.name),
			tools: tools
		)
	}
}


struct CharacterDetailView_Previews: PreviewProvider {
	static var previews: some View {
		CharacterDetailView(character: litterature[0], tools: allTools)
	}
}
