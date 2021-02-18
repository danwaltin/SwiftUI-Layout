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
		VStack {
			DWSplitView(
				left:
					GeometryReader { _ in
						Text("Select a character in the list")
					}
					
					.bindGeometry(to: $contentWidth) {$0.size.width}
					.toolbar {
						CharacterToolbar()
					},
				right:
					ToolsView(tools: tools)
					.bindGeometry(to: $toolsWidth) { $0.size.width},
				rightWidth: toolsWidth)
			Text("DebugInfo: contentWidth: \(contentWidth) | toolsWidth: \(toolsWidth)")
		}
    }
}

struct NoCharacterSelectedView_Previews: PreviewProvider {
    static var previews: some View {
		NoCharacterSelectedView(tools: allTools)
    }
}
