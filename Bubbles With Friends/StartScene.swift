//
//  StartScene.swift
//  Bubbles With Friends
//
//  Created by Ka Tai Ho on 12/27/17.
//  Copyright © 2017 Aw Yis. All rights reserved.
//

import SpriteKit
import GameplayKit

class StartScene: SKScene {
    
    let popSound = SKAction.playSoundFileNamed("pop.mp3" , waitForCompletion: false)
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.white
        refresh()
    }
    
    func refresh() {
        var bubble = SKSpriteNode(imageNamed: "bubble")
        let widthRatio = size.width / bubble.size.width
        let heightRatio = size.height / bubble.size.height
        
        let horizontalCount = Int(widthRatio);
        let verticalCount = Int(heightRatio);
        
        for w in 0...horizontalCount {
            for h in 1...verticalCount - 2 {
                bubble = SKSpriteNode(imageNamed: "bubble")
                bubble.name = "bubble" + String(w) + "," + String(h)
                let xPos = size.width * CGFloat(w) / CGFloat(horizontalCount) + (bubble.size.width/2)
                let yPos = size.height * CGFloat(h) / CGFloat(verticalCount) + (bubble.size.height/2)
                bubble.position = CGPoint(x: xPos, y: yPos)
                addChild(bubble)
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // 1 - Choose one of the touches to work with
        guard let touch = touches.first else {
            return
        }
        let location = touch.location(in: self)
        let node = atPoint(location)
        if let temp = node.name {
            print(temp)
            run(popSound)
        }
        node.removeFromParent()
    }
}

