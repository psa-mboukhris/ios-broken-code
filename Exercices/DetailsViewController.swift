//
//  DetailsViewController.swift
//  Exercices
//
//  Created by Jigar Jarsania on 7/13/20.
//  Copyright © 2020 Julien Nicco. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet var detailLbl: UILabel!
    @objc var screenName : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailLbl.text = "Result Detail : \(screenName)"
        // Do any additional setup after loading the view.
    }
    

    @IBAction func finishClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
    
}
