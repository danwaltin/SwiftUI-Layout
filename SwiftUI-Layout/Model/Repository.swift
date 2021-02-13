//
//  Repository.swift
//  SwiftUI-Layout
//
//  Created by Dan Waltin on 2021-02-13.
//

import Foundation

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

let allGroups = [litteratureGroup, scienceGroup]
