//
//  ContentView.swift
//  SwiftUI-Layout
//
//  Created by Dan Waltin on 2021-02-13.
//

import SwiftUI

struct Character : Identifiable {
	let id = UUID()
	let name: String
}

struct CharacterGroup {
	let title: String
	let characters: [Character]
}

let litterature = [
	Character(name: "Ronja Rövardotter"),
	Character(name: "Pippi Långstrump")
]

let science = [
	Character(name: "Ada Lovelace"),
	Character(name: "Alan Turing"),
	Character(name: "Albert Einstein"),
	Character(name: "Marie Curie")
]

let litteratureGroup = CharacterGroup(
	title: "Litterature",
	characters: litterature)

let scienceGroup = CharacterGroup(
	title: "Science",
	characters: science)

struct ContentView: View {
    var body: some View {
		NavigationView {
			List {
				SidebarSectionView(characterGroup: litteratureGroup)
				SidebarSectionView(characterGroup: scienceGroup)
			}
			.listStyle(SidebarListStyle())

		}
		.toolbar(content: {
			ToolbarItemGroup(placement: .navigation) {
				Button(action: {NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)}) {
					Image(systemName: "sidebar.left")
				}
				.help("Toggle Sidebar")
			}

		})
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
