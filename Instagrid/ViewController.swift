//
//  ViewController.swift
//  Instagrid
//
//  Created by admin on 22/04/2019.
//  Copyright © 2019 Jotaro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var upSwipe: UISwipeGestureRecognizer!
    @IBOutlet var leftSwipe: UISwipeGestureRecognizer!
    @IBOutlet var gridLayouts: [UIView]!
    @IBOutlet var buttonBar: [UIButton]!
    var currentImageView: UIImageView?
    var currentView: UIView!
    var currentButton: UIButton?
    var imagePicker = UIImagePickerController()

    @IBAction func layoutButtonIsClicked(_ sender: UIButton) {
        buttonBar[1].isSelected = true
        for element in buttonBar {
            element.isSelected = element == sender
        }
    }

    @IBAction func changeLayout(sender: UIButton) {
        currentView = gridLayouts[sender.tag]
        for element in gridLayouts {
            element.isHidden = element != currentView
        }
    }

    @IBAction func setCurrentButton(sender: UIButton) {
        currentButton = sender
    }

    @IBAction func newPhoto(_ sender: UIButton) {
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        self.present(self.imagePicker, animated: true, completion: nil)
    }

    @IBAction func share(_ sender: UISwipeGestureRecognizer) {
        if currentView == nil {
            currentView = gridLayouts[0]
        }
        let share = UIActivityViewController(activityItems: [tranformCurrentView(view: currentView)], applicationActivities: [])
        present(share, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        determineDeviceOrientation()
        upSwipe.direction = .up
        leftSwipe.direction = .left
        gridLayouts[2].isHidden = true
        buttonBar[1].isSelected = true
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {

        determineDeviceOrientation()
    }

    func determineDeviceOrientation() {
        upSwipe.isEnabled = UIScreen.main.bounds.size.width < UIScreen.main.bounds.size.height
        leftSwipe.isEnabled = !upSwipe.isEnabled
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            currentButton?.setImage(image, for: UIControl.State.normal)
            self.imagePicker.dismiss(animated: true, completion: nil)
        }
    }
    func tranformCurrentView(view: UIView) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
        let transformedImage = renderer.image { ctx in
            view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        }
        return transformedImage
    }
}


