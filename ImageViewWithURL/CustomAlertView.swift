//
//  CustomAlertView.swift
//  ImageViewWithURL
//
//  Created by iFlame on 4/9/17.
//  Copyright © 2017 iFlame. All rights reserved.
//

import UIKit

enum AlertActionType {
    case cancel
    case done
}

protocol CustomAlertDelegate {
    func didTapCustomAlertFor(action: AlertActionType, alertView : UIView)
}

class CustomAlertView: UIView {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var buttonCancel: UIButton!
    @IBOutlet weak var buttonDone: UIButton!
    
    var delegate : CustomAlertDelegate?
    
    @IBAction func buttonCancellPressed(_ sender: Any) {
        delegate?.didTapCustomAlertFor(action: .cancel, alertView:  self)
    }
    
    @IBAction func buttonDonePressed(_ sender: UIButton) {
        delegate?.didTapCustomAlertFor(action: .done, alertView:  self)
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        let view = super.hitTest(point, with: event)
        
        
        //print("Touch Point>> \(point)")
        //print("Touch Event>> \(String(describing: event))")
        
        return view
    }
    
    
    override func awakeFromNib() {
        
        //let shadowBackground = UIView(frame: UIScreen.main.bounds)
        //shadowBackground.backgroundColor = UIColor.init(white: 0.9, alpha: 0.1)
        //self.addSubview(shadowBackground)
        //shadowBackground.center = self.center
        //self.sendSubview(toBack: shadowBackground)
    
        
        self.layer.shadowColor = UIColor.red.cgColor
        self.layer.shadowRadius = 5
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = 0.5
        
    }
}
