//
//  ContentView.swift
//  SwiftUI-Layout
//
//  Created by Dan Waltin on 2021-02-13.
//

import SwiftUI

struct ContentView: View {
	let groups: [CharacterGroup]
	
	var body: some View {
		NavigationView {
			List {
				ForEach(groups) {
					SidebarSectionView(characterGroup: $0)
				}
			}
			.listStyle(SidebarListStyle())
		}
		.toolbar {
			Toolbar()
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(groups: allGroups)
    }
}
