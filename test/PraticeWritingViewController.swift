//
//  PraticeWritingViewController.swift
//  test
//
//  Created by USER on 2018. 11. 14..
//  Copyright © 2018년 USER. All rights reserved.
//

import UIKit

class PraticeWritingViewController: UIViewController {
    
    @IBOutlet var contentLabel:UILabel?
    
    var sentenseExam:SentenseProtocol?
    var nowCnt = 0
    var value:String?

    override func viewDidLoad() {
        super.viewDidLoad()

        let keyArr = [String]((sentenseExam?.sentenseDic.keys)!)
        contentLabel?.text = keyArr[nowCnt]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setModel(data:SentenseProtocol) {
        sentenseExam = data
    }
}
