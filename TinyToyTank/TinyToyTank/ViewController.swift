//
//  ViewController.swift
//  TinyToyTank
//
//  Created by nju on 2022/1/4.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    var tankAnchor:TinyToyTank._TinyToyTank?
    var isActionPlaying:Bool=false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the "Box" scene from the "Experience" Reality File
        tankAnchor=try! TinyToyTank.load_TinyToyTank()
        tankAnchor!.turret?.setParent(tankAnchor!.tank
        ,preservingWorldTransform: true)
        // Add the box anchor to the scene
        arView.scene.anchors.append(tankAnchor!)
        tankAnchor?.actions.actionComplete.onAction={_ in
            self.isActionPlaying=false
        }
    }
    @IBAction func OnTurretLeft(_ sender: Any) {
        if self.isActionPlaying{return}
        else{self.isActionPlaying=true}
        tankAnchor!.notifications.turretLeft.post()
    }
    @IBAction func OnShoot(_ sender: Any) {
        tankAnchor!.notifications.cannonFire.post()
    }
    @IBAction func OnTurrentRight(_ sender: Any) {
        tankAnchor!.notifications.turretRight.post()
    }
    @IBAction func OnTankLeft(_ sender: Any) {
        tankAnchor!.notifications.tankLeft.post()
    }
    @IBAction func OnTankForward(_ sender: Any) {
        tankAnchor!.notifications.tankForward.post()
    }
    @IBAction func OnTankRight(_ sender: Any) {
        tankAnchor!.notifications.tankRight.post()
    }
}
