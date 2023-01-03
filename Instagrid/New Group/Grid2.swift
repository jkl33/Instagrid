//
//  Grid2.swift
//  Instagrid
//
//  Created by admin on 30/04/2019.
//  Copyright © 2019 Jotaro. All rights reserved.
//

import UIKit

class Grid2: UIStackView {
    @IBOutlet weak var btn1Grid2: UIButton!
    @IBOutlet weak var btn2Grid2: UIButton!
    @IBOutlet weak var btn3Grid2: UIButton!
    var currentBtn: UIButton?
    @IBAction func imTheCurrentBtn( sender: UIButton) {
        currentBtn = sender
    }
    @objc func addImage(image: UIImage) {
        UIButton.setImage(currentBtn!)(image, for: UIControl.State.normal)
    }
}



