//
//  ViewController.swift
//  ImageViewWithURL
//
//  Created by iFlame on 4/9/17.
//  Copyright © 2017 iFlame. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CustomAlertControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        alertImage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
       /* let alert = Bundle.main.loadNibNamed("CustomAlertView", owner: nil, options: nil)!.first as! CustomAlertView
        alert.delegate = self
        
        alert.labelTitle.text = "Hello Custom Alert"
        alert.labelDescription.text = "Hello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom AlertHello Custom Alert"

        alert.center = self.view.center
        
        self.view.addSubview(alert)
        alert.translatesAutoresizingMaskIntoConstraints = false
        //view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        let centerXConstraint = NSLayoutConstraint.init(item: alert, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: alert.superview!, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: 0)
        let centerYConstraint = NSLayoutConstraint.init(item: alert, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: alert.superview!, attribute: NSLayoutAttribute.centerY, multiplier: 1.0, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: alert, attribute: NSLayoutAttribute.width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: UIScreen.main.bounds.width - 40)
        alert.superview?.addConstraints([centerXConstraint, centerYConstraint])
        alert.addConstraint(widthConstraint)
        
        alert.setNeedsLayout()
        alert.setNeedsDisplay()*/
        
        
        
        _ = CustomAlertController.showAlert(controller: self, delegate: self)
        
        
        
    }
    
    func didTapCustomAlertFor(action: AlertActionType, controller:  CustomAlertController) {
        print("action ==>> \(action)")
        
        switch action {
        case .cancel:
            print("Cancelled")
        case .done:
            print("DONE")
        }
        
        controller.dismiss()
        
    }

    private func alertImage() {
        let alertView = UIAlertController(title: "", message: "", preferredStyle: UIAlertControllerStyle.alert)
        
        let imageView = getImageFromUrl("https://www.gstatic.com/images/branding/googlelogo/2x/googlelogo_color_284x96dp.png")
        
        
        present(alertView, animated: true, completion: {
            _ in
            
            alertView.view.addSubview(imageView)
        })
        
    }
    
    private func getImageFromUrl(_ url: String) -> UIImageView {
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 500, height:  500))
        let url = URL(string: url)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        imageView.image = UIImage(data: data!)
        return imageView
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

