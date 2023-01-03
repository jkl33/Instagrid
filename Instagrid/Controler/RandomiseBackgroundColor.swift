//
//  RandomiseBackgroundColorViewController.swift
//  Instagrid
//
//  Created by admin on 30/04/2019.
//  Copyright © 2019 Jotaro. All rights reserved.
//

import UIKit

class RandomiseBackgroundColorViewController: UIViewController {
 @IBOutlet weak var gridView: GridView!
    override func viewDidLoad() {
        super.viewDidLoad()
       //
        
        // Do any additional setup after loading the view.
    }
    
//    @IBAction func rdmClr(_ sender: UIPanGestureRecognizer) {
//        gridView.currentView?.backgroundColor = random()
//    }
     @IBOutlet var leftSwipe: UISwipeGestureRecognizer!
    @IBAction func rdmColor(_ sender: UIPanGestureRecognizer) {
    }
//    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
//        if sender.state == .ended {
//            switch sender.direction {
//            case .right:
//                view.backgroundColor = .red
//            case .left:
//                ViewController.
//            case .up:
//                view.backgroundColor = .green
//            case .down:
//                view.backgroundColor = random()
//            default:
//                break
//            }
//        }
//    }
    
    func random () -> UIColor {
        return UIColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: 1.0)
    }
}
