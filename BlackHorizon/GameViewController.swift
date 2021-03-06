import UIKit
import SpriteKit
import GameplayKit


class GameViewController: UIViewController {
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content, including enditites and graphs.
        if let scene = GKScene(fileNamed: "GameScene") {
            
            // Get the SKScene (SpriteKit scene) from the loaded GKScene (GameKit scene).
            if let sceneNode = scene.rootNode as! GameScene? {
                
                // Copy gameplay related content over to the scene.
                sceneNode.entities = scene.entities
                sceneNode.graphs = scene.graphs
                
                // Set the scale mode to scale to fit the window.
                sceneNode.scaleMode = .aspectFill
                
                // Present the scene.
                if let view = self.view as! SKView? {
                    
                    view.presentScene(sceneNode)
                    
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = false
                    view.showsNodeCount = false
                    
                }
                
            }
            
        }
        
    }
    
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .portrait
        } else {
            return .portrait
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
}
