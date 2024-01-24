//
//  ViewController.swift
//  CounterApp
//
//  Created by Artak Ter-Stepanyan on 24.01.24.
//

import UIKit

protocol NumberDelegate{
    func passDataBack(_ num: Int)
}

class EditorViewController: UIViewController {
    
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var numberLabel: UILabel!
    
    
    var delegate: NumberDelegate?

    var num: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.sizeToFit()
        plusButton.layer.cornerRadius = 12
        minusButton.layer.cornerRadius = 12
        numberLabel.text = "\(num ?? 0)"
    }
    
    

    
    @IBAction func increment(_ sender: Any) {
        incrementNumber()
    }
    @IBAction func decrement(_ sender: Any) {
        decrementNumber()
    }
    
    
    
    func incrementNumber() {
        if var num = Int(numberLabel.text ?? "0"){
            num += 1
            numberLabel.text = "\(num)"
        }
    }

    func decrementNumber() {
        if var num = Int(numberLabel.text ?? "0"){
            num -= 1
            numberLabel.text = "\(num)"
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        delegate?.passDataBack(Int(numberLabel.text ?? "0")!)
    }
}

