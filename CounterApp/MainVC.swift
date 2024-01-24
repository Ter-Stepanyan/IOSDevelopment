//
//  MainVC.swift
//  CounterApp
//
//  Created by Artak Ter-Stepanyan on 24.01.24.
//

import UIKit

class MainVC: UIViewController, NumberDelegate {
    
    @IBOutlet weak var goToEditButton: UIButton!
    @IBOutlet weak var numberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.sizeToFit()
        goToEditButton.layer.cornerRadius = 12
    }
    
    func passDataBack(_ num: Int) {
        numberLabel.text = "\(num)"
    }
    
    @IBAction func toEditor(_ sender: Any) {
        let number = Int(numberLabel.text ?? "0")
        performSegue(withIdentifier: "toEditor", sender: number)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "toEditor" {
               if let destinationVC = segue.destination as? EditorViewController {
                   destinationVC.delegate = self
                   destinationVC.num = Int(numberLabel.text ?? "0")
               }
           }
       }
}
