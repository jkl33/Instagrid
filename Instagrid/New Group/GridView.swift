//
//  GridView.swift
//  InstagridV2
//
//  Created by admin on 09/04/2019.
//  Copyright © 2019 Jotaro. All rights reserved.
//

import UIKit

class GridView: UIView {
    @IBOutlet weak var grid1: Grid1!
    @IBOutlet weak var grid2: Grid2!
    @IBOutlet weak var grid3: Grid3!
    var currentImageView: UIImageView?
    var currentView: UIView?
    override func didMoveToWindow() {
        grid1.isHidden = true
        grid2.isHidden = true
        grid3.isHidden = true
        if self.window != nil {
            let notifLayout1 = NSNotification.Name("btn1Click")
            NotificationCenter.default.addObserver(self, selector: #selector(layout1),name: notifLayout1, object: nil)
            let notifLayout2 = NSNotification.Name("btn2Click")
            NotificationCenter.default.addObserver(self, selector: #selector(layout2),name: notifLayout2, object: nil)
            let notifLayout3 = NSNotification.Name("btn3Click")
            NotificationCenter.default.addObserver(self, selector: #selector(layout3),name: notifLayout3, object: nil)
        }
    }
    @IBOutlet weak var myContraint: NSLayoutConstraint!
    @objc func layout1() {
        grid1.isHidden = false
        grid2.isHidden = true
        grid3.isHidden = true
        currentView = grid1
    }
    @objc func layout2() {
        grid1.isHidden = true
        grid2.isHidden = false
        grid3.isHidden = true
        currentView = grid2
    }
    @objc func layout3() {
        grid1.isHidden = true
        grid2.isHidden = true
        grid3.isHidden = false
        currentView = grid3
    }
    func addImage(image: UIImage) {
        currentImageView?.image = image
        if grid1.isHidden == false{
            grid1.addImage(image: image)
        }
        if grid2.isHidden == false{
            grid2.addImage(image: image)
        }
        if grid3.isHidden == false{
            grid3.addImage(image: image)
        }
    }
}
