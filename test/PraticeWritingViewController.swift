//
//  PraticeWritingViewController.swift
//  test
//
//  Created by USER on 2018. 11. 14..
//  Copyright © 2018년 USER. All rights reserved.
//

import UIKit

class PraticeWritingViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet var contentLabel:UILabel!
    @IBOutlet var writeTextView:UITextView!
    
    var sentenseExam:SentenseProtocol?
    var nowCnt = 0
    var value:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        writeTextView.delegate = self

        let keyArr = [String]((sentenseExam?.sentenseDic.keys)!)
        contentLabel?.text = keyArr[nowCnt]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setModel(data:SentenseProtocol) {
        sentenseExam = data
    }
    
    func compareWriteAndOrigin(write:String)  {
        
        var msg:String?
        let origin = sentenseExam?.sentenseDic[contentLabel.text!]
        if (origin == write) { //"The taxi arrived at the hotel."
            msg = "sucess"
        }else {
            msg = "fail : \(write)"
        }
        let alertController = UIAlertController(title: "", message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { (result : UIAlertAction) -> Void in
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            compareWriteAndOrigin(write: textView.text)
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}
