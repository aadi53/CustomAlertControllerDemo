//
//  CustomAlertView.swift
//  ImageViewWithURL
//
//  Created by iFlame on 4/9/17.
//  Copyright © 2017 iFlame. All rights reserved.
//

import UIKit


protocol CustomAlertControllerDelegate {
    func didTapCustomAlertFor(action: AlertActionType, controller : CustomAlertController)
}

class CustomAlertController: UIViewController {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var buttonCancel: UIButton!
    @IBOutlet weak var buttonDone: UIButton!
    
    var delegate : CustomAlertControllerDelegate?
    
    @IBAction func buttonCancellPressed(_ sender: Any) {
        delegate?.didTapCustomAlertFor(action: .cancel, controller:  self)
    }
    
    @IBAction func buttonDonePressed(_ sender: UIButton) {
        delegate?.didTapCustomAlertFor(action: .done, controller:  self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.25, animations: {
            self.view.subviews[0].transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }) { (isFinished) in
            
        }

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func awakeFromNib() {
        
        //let shadowBackground = UIView(frame: UIScreen.main.bounds)
        //shadowBackground.backgroundColor = UIColor.init(white: 0.9, alpha: 0.1)
        //self.addSubview(shadowBackground)
        //shadowBackground.center = self.center
        //self.sendSubview(toBack: shadowBackground)
    
        
        self.view.subviews[0].layer.shadowColor = UIColor.red.cgColor
        self.view.subviews[0].layer.shadowRadius = 5
        self.view.subviews[0].layer.masksToBounds = false
        self.view.subviews[0].clipsToBounds = false
        self.view.subviews[0].layer.shadowOffset = CGSize.zero
        self.view.subviews[0].layer.shadowOpacity = 0.5
        
    }
    static func showAlert(controller : UIViewController, delegate : CustomAlertControllerDelegate)-> CustomAlertController{
        
        let alertController = CustomAlertController(nibName: "CustomAlertController", bundle: nil)
        //self.present(alertController, animated: true, completion: nil)
        alertController.delegate = delegate
        controller.addChildViewController(alertController)
        alertController.view.frame = controller.view.bounds
        alertController.view.subviews[0].transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        controller.view.addSubview(alertController.view)
        
        
        alertController.didMove(toParentViewController: controller)

        return alertController
    }
    
    func dismiss(){

        
        UIView.animate(withDuration: 0.25, animations: {
            self.view.subviews[0].transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }) { (isFinished) in
            //controller.dismiss(animated: false, completion: nil)
            self.view.removeFromSuperview()
            self.removeFromParentViewController()
            self.willMove(toParentViewController: nil)
        }

    }
    
}
