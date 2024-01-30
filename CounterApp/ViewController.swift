//
//  ViewController.swift
//  CounterApp
//
//  Created by Artak Ter-Stepanyan on 24.01.24.
//

import UIKit

protocol NumberDelegate: AnyObject {
    func passDataBack(_ number: Int)
}

class EditorViewController: UIViewController {

    @IBOutlet weak var incrementButton: UIButton!
    @IBOutlet weak var decrementButton: UIButton!
    @IBOutlet weak var numberDisplayLabel: UILabel!

    weak var delegate: NumberDelegate?
    var number: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        numberDisplayLabel.sizeToFit()
        incrementButton.layer.cornerRadius = 12
        decrementButton.layer.cornerRadius = 12
        numberDisplayLabel.text = "\(number ?? 0)"
    }

    override func viewWillDisappear(_ animated: Bool) {
        delegate?.passDataBack(Int(numberDisplayLabel.text ?? "0")!)
    }

    @IBAction func increment(_ sender: Any) {
        incrementNumber()
    }

    @IBAction func decrement(_ sender: Any) {
        decrementNumber()
    }

    func incrementNumber() {
        if var number = Int(numberDisplayLabel.text ?? "0") {
            number += 1
            numberDisplayLabel.text = "\(number)"
        }
    }

    func decrementNumber() {
        if var number = Int(numberDisplayLabel.text ?? "0") {
            number -= 1
            numberDisplayLabel.text = "\(number)"
        }
    }
}
