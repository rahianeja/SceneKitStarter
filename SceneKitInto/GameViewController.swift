//
//  GameViewController.swift
//  SceneKitInto
//
//  Created by rohit aneja on 18/03/18.
//  Copyright © 2018 rohi aneja. All rights reserved.
//

import UIKit
//import QuartzCore
import SceneKit

var scnView: SCNView!
var scnScene: SCNScene!
var cameraNode: SCNNode!
var spawnTime: TimeInterval = 0

class GameViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupScene()
        setupCamera()
//        spawnShape()
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func setupView() {
        scnView = self.view as! SCNView
        scnView.allowsCameraControl = false
        scnView.autoenablesDefaultLighting = true
        scnView.delegate = self
        scnView.isPlaying = true
    }
    
    func setupScene() {
        scnScene = SCNScene()
        scnView.scene = scnScene
        scnScene.background.contents = "courseArt.scnassets/background.png"
    }
    
    func setupCamera() {
        let myScreenSize: CGRect = UIScreen.main.bounds
        let myScreenHeight = myScreenSize.height
        let cameraPosition = Float(myScreenHeight)*(0.01)
        cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x:0, y:Float(cameraPosition), z:15)
        scnScene.rootNode.addChildNode(cameraNode)
    }
    
    
    func  handleTouch(node: SCNNode) {
        node.removeFromParentNode()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: scnView)
        let hitResults = scnView.hitTest(location, options: nil)
        if let result = hitResults.first {
            handleTouch(node: result.node)
        }
    }
    
    func spawnShape() {
        var geometry:SCNGeometry
        
        switch ShapeType.random() {
        case .cone:
            geometry = SCNCone(topRadius: 0.25, bottomRadius: 0.5, height: 1.0)
        case .capsule:
            geometry = SCNCapsule(capRadius: 0.3, height: 2.5)
        case .box:
            geometry = SCNBox(width: 5, height: 5, length: 5, chamferRadius: 0)
        case .sphere:
            geometry = SCNSphere(radius: 0.5)
        case .tube:
            geometry = SCNTube(innerRadius: 0.25, outerRadius: 0.5, height: 1)
        case .cylinder:
            geometry = SCNCylinder(radius: 0.3, height: 0.25)
        case .pyramid:
            geometry = SCNPyramid(width: 1, height: 1, length: 1)
        case .torus:
            geometry = SCNTorus(ringRadius: 0.5, pipeRadius: 0.25)
        }
        let geometryNode = SCNNode(geometry:geometry)
        scnScene.rootNode.addChildNode(geometryNode)
        
        geometryNode.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        
        let randomX = Float.random(min: -3, max: 3)
        let randomY = Float.random(min: 8, max:20)
        
        let force = SCNVector3(x: randomX, y: randomY, z: 0)
        let position = SCNVector3(x:0.07, y:0.07, z:0.07)
        
        geometryNode.physicsBody?.applyForce(force, at: position, asImpulse: true)
        
        let color = UIColor.random()
        geometry.materials.first?.diffuse.contents = color
        
        let trailEmitter = drawParticles(color: color, geometry: geometry)
        geometryNode.addParticleSystem(trailEmitter)
    }
    
    func cleanUp() {
        for node in scnScene.rootNode.childNodes {
            if node.presentation.position.y < -10 {
                node.removeFromParentNode()
            }
        }
    }
    
    func drawParticles(color:UIColor, geometry: SCNGeometry) -> SCNParticleSystem {
        let trail = SCNParticleSystem(named: "Fire.scnp", inDirectory: nil)!
        trail.particleColor = color
        trail.emitterShape = geometry
        return trail
    }
    
}

extension GameViewController: SCNSceneRendererDelegate {
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        if time > spawnTime {
            spawnShape()
            spawnTime = time + TimeInterval(Float.random(min: 0.3, max: 1.8))
        }
        cleanUp()
    }
    
    
}

