//
//  MainVC.swift
//  CounterApp
//
//  Created by Artak Ter-Stepanyan on 24.01.24.
//

import UIKit

class MainVC: UIViewController, NumberDelegate {

    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var numberDisplayLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        numberDisplayLabel.sizeToFit()
        editButton.layer.cornerRadius = 12
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "toEditor" {
               if let destinationVC = segue.destination as? EditorViewController {
                   destinationVC.delegate = self
                   destinationVC.number = Int(numberDisplayLabel.text ?? "0")
               }
           }
       }

    func passDataBack(_ number: Int) {
        numberDisplayLabel.text = "\(number)"
    }

    @IBAction func toEditor(_ sender: Any) {
        let number = Int(numberDisplayLabel.text ?? "0")
        performSegue(withIdentifier: "toEditor", sender: number)
    }
}
