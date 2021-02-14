//
//  ToolsView.swift
//  SwiftUI-Layout
//
//  Created by Dan Waltin on 2021-02-13.
//

import SwiftUI

struct ToolsView: View {
	let tools: [Tool]
	
    var body: some View {
		List {
			ForEach(tools) {
				Text($0.name)
			}
		}
		.listStyle(SidebarListStyle())
    }
}

struct ToolsView_Previews: PreviewProvider {
    static var previews: some View {
		ToolsView(tools: allTools)
    }
}
