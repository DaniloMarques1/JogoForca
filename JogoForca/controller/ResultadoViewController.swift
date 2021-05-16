//
//  ResultadoViewController.swift
//  JogoForca
//
//  Created by IFPB on 16/05/21.
//  Copyright © 2021 IFPB. All rights reserved.
//

import UIKit

class ResultadoViewController: UIViewController {
    
    var resultado: String?
 
    @IBOutlet weak var lbResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lbResult.text = self.resultado
    }
    
    @IBAction func voltar(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
