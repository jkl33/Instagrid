//
//  Grid3.swift
//  Instagrid
//
//  Created by admin on 30/04/2019.
//  Copyright © 2019 Jotaro. All rights reserved.
//

import UIKit

class Grid3: UIStackView {
    @IBOutlet weak var btn1Grid3: UIButton!
    @IBOutlet weak var btn2Grid3: UIButton!
    @IBOutlet weak var btn3Grid3: UIButton!
    @IBOutlet weak var btn4Grid3: UIButton!
    var currentBtn: UIButton?
    @IBAction func imTheCurrentBtn( sender: UIButton) {
        currentBtn = sender
    }
    @objc func addImage(image: UIImage) {
        UIButton.setImage(currentBtn!)(image, for: UIControl.State.normal)
    }
}
