//
//  GameScene.swift
//  GameofLife
//
//  Created by Kadiatou Diallo on 6/24/16.
//  Copyright (c) 2016 Kadiatou Diallo. All rights reserved.
//

import SpriteKit

/* UI Objects */
var stepButton: MSButtonNode!
var playButton: MSButtonNode!
var pauseButton: MSButtonNode!
var populationLabel: SKLabelNode!
var generationLabel: SKLabelNode!

/* Game objects */
var gridNode: Grid!

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
    /* Connect UI scene objects */
      stepButton = childNodeWithName("stepButton") as! MSButtonNode
      playButton = childNodeWithName("playButton") as! MSButtonNode
      pauseButton = childNodeWithName("pauseButton") as! MSButtonNode
      populationLabel = childNodeWithName("populationLabel") as! SKLabelNode
      generationLabel = childNodeWithName("generationLabel") as! SKLabelNode
      gridNode = childNodeWithName("gridNode") as! Grid
        
        /* Setup testing button selected handler */
        stepButton.selectedHandler = {
            self.stepSimulation()
        }
        
        /* Create an SKAction based timer, 0.5 second delay */
        let delay = SKAction.waitForDuration(0.5)
        
        /* Call the stepSimulation() method to advance the simulation */
        let callMethod = SKAction.performSelector(#selector(GameScene.stepSimulation), onTarget: self)
        
        /* Create the delay,step cycle */
        let stepSequence = SKAction.sequence([delay,callMethod])
        
        /* Create an infinite simulation loop */
        let simulation = SKAction.repeatActionForever(stepSequence)
        
        /* Run simulation action */
        self.runAction(simulation)
        
        /* Default simulation to pause state */
        self.paused = true
        
        /* Setup play button selected handler */
        playButton.selectedHandler = {
            self.paused = false
        }
        
        /* Setup pause button selected handler */
        pauseButton.selectedHandler = {
            self.paused = true
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func stepSimulation() {
        /* Step Simulation */
        
        /* Run next step in simulation */
        gridNode.evolve()
        
        /* Update UI label objects */
        populationLabel.text = String(gridNode.population)
        generationLabel.text = String(gridNode.generation)
    }
}
