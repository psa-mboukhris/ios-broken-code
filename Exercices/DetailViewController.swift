//
//  DetailViewController.swift
//  Exercices
//
//  Created by Julien Nicco on 25/03/2020.
//  Copyright © 2020 Julien Nicco. All rights reserved.
//

import Foundation
import UIKit

@objc public class DetailViewController: UIViewController {

    @objc public var stringDetail = ""
    
    @IBOutlet weak var label: UILabel!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.label.text = "Result detail : \(stringDetail)"
    }
    

    /* ---------------
     
        Return to first screen here
     
     -----------------*/
    @IBAction func finishAction(_ sender: UIButton) {
        if let rootView = self.navigationController?.viewControllers[0] as? ViewController {
            rootView.stringResult = stringDetail
        }

        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
