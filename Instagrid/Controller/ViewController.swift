//
//  ViewController.swift
//  InstagridV2
//
//  Created by admin on 06/04/2019.
//  Copyright © 2019 Jotaro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var imagePicked: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    @IBAction func addPhoto(_ sender: Any) {
        self.imagePicker = UIImagePickerController()
        self.imagePicker.delegate = self
        self.imagePicker.sourceType = .photoLibrary
        self.imagePicker.allowsEditing = false
        self.present(self.imagePicker, animated: true, completion: nil)
    
}
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imagePicked.image = image
            self.imagePicker.dismiss(animated: true, completion: nil)
        }
    
    }

}
