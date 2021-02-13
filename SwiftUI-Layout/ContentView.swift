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

struct ContentView: View {
    var body: some View {
		NavigationView {
			List {
				Section(
					header: Text("Litterature"),
					content: {
						ForEach(litterature) {character in
							NavigationLink(
								destination: Text(character.name),
								label: {
									Text(character.name)
										.fixedSize()
								}
							)
						}
					})
				Section(
					header: Text("Science"),
					content: {
						ForEach(science) {character in
							NavigationLink(
								destination: Text(character.name),
								label: {
									Text(character.name)
										.fixedSize()
								}
							)
						}
					})
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
