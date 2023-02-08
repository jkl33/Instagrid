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
    @IBOutlet var gridContainer: UIView!
    @IBOutlet var gridLayouts: [UIView]!
    @IBOutlet var buttonBar: [UIButton]!
    var currentView: UIView!
    var currentButton: UIButton?
    var imagePicker = UIImagePickerController()

    @IBAction func layoutButtonIsClicked(_ sender: UIButton) {
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

    @IBAction func animateView(_ sender: UISwipeGestureRecognizer) {
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        var directionTransform: CGAffineTransform

        if upSwipe.isEnabled == true {
            directionTransform = CGAffineTransform(translationX: 0, y: -screenHeight)
        } else {
            directionTransform = CGAffineTransform(translationX: -screenWidth, y: 0)
        }
        UIView.animate(withDuration: 2, animations: {
            self.gridContainer.transform = directionTransform
        }, completion: {_ in
            self.share()
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        determineDeviceOrientation()
        upSwipe.direction = .up
        leftSwipe.direction = .left
        gridLayouts.sort { $0.tag < $1.tag }
        gridLayouts[2].isHidden = true
        buttonBar[1].isSelected = true
        setDefaultView()
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {

        determineDeviceOrientation()
    }

    func setDefaultView() {
        if currentView == nil {
            currentView = gridLayouts[1]
        }
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

    func share() {
        let share = UIActivityViewController(activityItems: [tranformCurrentView(view: currentView)], applicationActivities: nil)
        share.completionWithItemsHandler = { activity, success, items, error in
            self.animateReverse()
        }
        present(share, animated: true, completion: nil)
    }

    func animateReverse() {
        UIView.animate(withDuration: 2, animations: {
            self.gridContainer.transform = CGAffineTransformIdentity
        }, completion: nil)
    }

    func tranformCurrentView(view: UIView) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
        let transformedImage = renderer.image {_ in
            view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        }
        return transformedImage
    }
}


