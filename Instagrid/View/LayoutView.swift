//
//  LayoutView.swift
//  Instagrid
//
//  Created by admin on 02/04/2019.
//  Copyright © 2019 Jotaro. All rights reserved.
//

import UIKit

class LayoutView: UIView {

    @IBOutlet weak var stackViewOfBtn: UIStackView!
    @IBOutlet weak var gridBtn1: UIButton!
    @IBOutlet weak var gridBtn2: UIButton!
    @IBOutlet weak var gridBtn3: UIButton!
    
    @IBAction func btn1Click(_ sender: UIButton) {
        sender.isSelected = true
    }
    @IBAction func btn2Click(_ sender: UIButton) {
        sender.isSelected = true
    }
    @IBAction func btn3Click(_ sender: UIButton) {
        sender.isSelected = true
    }
    
}
