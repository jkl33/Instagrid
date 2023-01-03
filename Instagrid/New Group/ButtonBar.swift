//
//  ButtonBar.swift
//  Instagrid
//
//  Created by admin on 23/04/2019.
//  Copyright © 2019 Jotaro. All rights reserved.
//

import UIKit

class ButtonBar: UIStackView {
    @IBOutlet  var gridBtn1: [UIButton]!
    @IBAction func btn1Click(_ sender: UIButton) {

        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "btn1Click"), object: nil)
    }
    @IBAction func btn2Click(_ sender: UIButton) {

        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "btn2Click"), object: nil)
    }
    @IBAction func btn3Click(_ sender: UIButton) {

         NotificationCenter.default.post(name: NSNotification.Name(rawValue: "btn3Click"), object: nil)
    }
}
