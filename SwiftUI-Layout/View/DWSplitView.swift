//
//  DWSplitView.swift
//  SwiftUI-Layout
//
//  Created by Dan Waltin on 2021-02-17.
//

import SwiftUI

struct DWSplitView<VLeft, VRight>: NSViewControllerRepresentable where VLeft:View, VRight: View {
	@EnvironmentObject var displayedAreas: DisplayedAreas

	let left: VLeft
	let right: VRight
	let rightWidth: CGFloat
	
	func makeNSViewController(context: Context) -> NSViewController {
		let controller = SplitViewController(
			left: GeometryReader { g in left},
			right: GeometryReader { g in right},
			rightWidth: rightWidth)

		return controller
	}
	
	func updateNSViewController(_ nsViewController: NSViewController, context: Context) {
		// no-op
	}
}

struct DWSplitView_Previews: PreviewProvider {
    static var previews: some View {
		DWSplitView(left: PaneView(text: "sidebar"), right: PaneView(text: "main content"), rightWidth: 150)
    }
}

struct PaneView: View {
	@State var text: String
	
	var body: some View {
		HStack {
			Text("Hello \(text)")
				.padding(.vertical, 30)
		}.frame(maxWidth: .infinity, maxHeight: .infinity)
			.background(Color.blue)
	}
}

class SplitViewController<VLeft, VRight>: NSSplitViewController where VLeft:View, VRight: View {
	var left : NSHostingController<VLeft>
	var right : NSHostingController<VRight>
	var rightWidth: CGFloat
	
	init(left: VLeft, right: VRight, rightWidth: CGFloat) {
		self.left = NSHostingController(rootView: left)
		self.right = NSHostingController(rootView: right)
		self.rightWidth = rightWidth
		
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		left = NSHostingController(rootView: EmptyView() as! VLeft)
		right = NSHostingController(rootView: EmptyView() as! VRight)
		self.rightWidth = 30
		super.init(coder: coder)
	}
	
	private let autoSaveName = "com.waltin.autoSaveName:splitViewController"
	
	override func viewDidAppear() {
		let dividerPosition = splitView.frame.width - rightWidth
		splitView.setPosition(rightWidth, ofDividerAt: 0)
	}
	
	override func viewDidLoad() {
		splitView.isVertical = true
		splitView.dividerStyle = .thin
		splitView.autosaveName = NSSplitView.AutosaveName(autoSaveName)
		splitView.identifier = NSUserInterfaceItemIdentifier(rawValue: autoSaveName)

		left.view.widthAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
		right.view.widthAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true

		let sidebarItem = NSSplitViewItem(viewController: left)
		sidebarItem.canCollapse = false

		addSplitViewItem(sidebarItem)

		let mainItem = NSSplitViewItem(viewController: right)
		addSplitViewItem(mainItem)
	}
}
