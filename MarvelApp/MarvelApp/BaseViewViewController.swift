//
//  BaseViewViewController.swift
//  MarvelApp
//
//  Created by Asit Aslan on 1.02.2022.
//  Copyright © 2022 Asit Aslan. All rights reserved.
//

import UIKit

class BaseViewViewController: UIViewController {

    var serviceController = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func showError(error:Error){
        let alert = UIAlertController(title: "Warning", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
