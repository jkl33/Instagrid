//
//  ViewController.swift
//  Instagrid
//
//  Created by admin on 22/04/2019.
//  Copyright © 2019 Jotaro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var gridView: GridView!
    var imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        determineMyDeviceOrientation()
        upSwipe.direction = .up
        leftSwipe.direction = .left
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {

        determineMyDeviceOrientation()
    }

    func determineMyDeviceOrientation()
    {
        if UIDevice.current.orientation.isLandscape {
            upSwipe.isEnabled = false
            leftSwipe.isEnabled = true
        } else {
            leftSwipe.isEnabled = false
            upSwipe.isEnabled = true
        }
    }

    @IBOutlet var upSwipe: UISwipeGestureRecognizer!
    @IBOutlet var leftSwipe: UISwipeGestureRecognizer!
    @IBAction func newPhoto(_ sender: UIButton) {
        self.imagePicker = UIImagePickerController()
        self.imagePicker.delegate = self
        self.imagePicker.sourceType = .photoLibrary
        self.imagePicker.allowsEditing = false
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("ok")
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            gridView.addImage(image: image)
            self.imagePicker.dismiss(animated: true, completion: nil)
        }
    }
    func tranformCurrentView(view: UIView) -> UIImage{
        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
        let transformedImage = renderer.image { ctx in
            view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        }
        return transformedImage
    }
    @IBAction func share(_ sender: UISwipeGestureRecognizer) {
        guard let curentView = gridView.currentView else {
            return
        }
        let share = UIActivityViewController(activityItems: [tranformCurrentView(view: curentView)], applicationActivities: [])
        present(share, animated: true)

        //
        //        if let curentView = gridView.currentView {
        //            let share = UIActivityViewController(activityItems: [tranformCurrentView(view: curentView)], applicationActivities: [])
        //            present(share, animated: true)
        //        }

    }
    func randomColorPicker () -> UIColor {
        return UIColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: 1.0)
    }
    @IBAction func changeBackgroundColor(_ sender: UISwipeGestureRecognizer) {
        gridView.currentView?.backgroundColor = randomColorPicker()
    }
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        gridView.currentView?.backgroundColor = randomColorPicker()
    }
}

