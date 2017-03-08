//
//  GameViewController.swift
//  Uno
//
//  Created by Andre Calfa on 3/4/17.
//  Copyright © 2017 Calfa. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
	var menuState = Menu()
	var gamePlayState = GamePlay()
	var endGameState = EndGame()
	var stateMachine : GKStateMachine?

	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Load card deck
		_ = CardUtils.loadDeck()
		// Shuffle card deck
		CardUtils.shuffleDeck()
		
		// Create state machines
		createStateSm()
		
		// TODO: add a scene per state in the state machine
		let scene = GameScene(size: view.bounds.size)
		let skView = view as! SKView
		skView.showsFPS = true
		skView.showsNodeCount = true
		skView.ignoresSiblingOrder = true
		scene.scaleMode = .resizeFill
		skView.presentScene(scene)
	}
	
    override var prefersStatusBarHidden: Bool {
        return true
    }
	
	func createStateSm() {
		stateMachine = GKStateMachine(states: [menuState, gamePlayState, endGameState])
	}
}
