//
//  SKScene.swift
//  GeneCloning
//
//  Created by Madhav Gulati on 4/23/22.
//

import SpriteKit

let fish1 = SKSpriteNode(imageNamed: "fish")
let fish2 = SKSpriteNode(imageNamed: "fish")
let tank = SKSpriteNode(imageNamed: "tank")

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.white
        tank.position = CGPoint(x: self.frame.width/2, y: self.frame.height/2)
        fish1.position = CGPoint(x: self.frame.width/2, y: self.frame.height/2)
        fish2.position = CGPoint(x: self.frame.width/4, y: self.frame.height/8*5)
        
        tank.size = CGSize(width: 450, height:tank.size.height*450/tank.size.width)
        fish1.size = CGSize(width: 100, height:fish1.size.height*100/fish1.size.width)
        fish2.size = CGSize(width: 100, height:fish2.size.height*100/fish2.size.width)
        fish2.xScale = -1
        
        addChild(tank)
        addChild(fish1)
        addChild(fish2)
        
        let goleft1:SKAction = SKAction.move(to:CGPoint(x:self.frame.width*0.2, y: self.frame.height/2), duration: TimeInterval(CGFloat(4.0)))
        let flipToRight1:SKAction = SKAction.scaleX(to: -1, duration: 0.2)
        let goright1:SKAction = SKAction.move(to:CGPoint(x:self.frame.width*0.8, y: self.frame.height/2), duration: TimeInterval(CGFloat(4.0)))
        let flipToLeft1:SKAction = SKAction.scaleX(to: 1, duration: 0.2)
        let sequence1:SKAction = SKAction.sequence([goleft1, flipToRight1, goright1, flipToLeft1])
        let sequenceRepeat1:SKAction = SKAction.repeatForever(sequence1)
        
        let goleft2:SKAction = SKAction.move(to:CGPoint(x:self.frame.width*0.2, y: self.frame.height/8*5), duration: TimeInterval(CGFloat(4.0)))
        let flipToRight2:SKAction = SKAction.scaleX(to: -1, duration: 0.2)
        let goright2:SKAction = SKAction.move(to:CGPoint(x:self.frame.width*0.8, y: self.frame.height/8*5), duration: TimeInterval(CGFloat(4.0)))
        let flipToLeft2:SKAction = SKAction.scaleX(to: 1, duration: 0.2)
        let sequence2:SKAction = SKAction.sequence([goright2, flipToLeft2, goleft2, flipToRight2])
        let sequenceRepeat2:SKAction = SKAction.repeatForever(sequence2)
        
        fish1.run(sequenceRepeat1)
        fish2.run(sequenceRepeat2)
    }
}
