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
    @IBOutlet var completLabel:UILabel!
    @IBOutlet var writeTextView:UITextView!
    
    var sentenseExam:SentenseProtocol?
    var nowCnt = 0
    var value:String?
    let write = SentenseForWrite.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        
        writeTextView.delegate = self

//        let keyArr = [String]((sentenseExam?.sentenseDic.keys)!)
        write.saveComplet(target: sentenseExam!, sentenseKey: "")
        contentLabel?.text = write.getNoNextCompletKey(target: sentenseExam!) //keyArr[nowCnt]
        setCompletLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setModel(data:SentenseProtocol) {
        sentenseExam = data
    }
    
    func setCompletLabel() {
        let completCnt = write.getProgress(target: sentenseExam!)
        completLabel.text = "complet : \(Int(completCnt))%"
    }
    
    func compareWriteAndOrigin(writeTxt:String)  {
        
        let alertController = UIAlertController(title: "", message: "", preferredStyle: .alert)
       
        
        let origin = sentenseExam?.sentenseDic[contentLabel.text!]
        if (origin == writeTxt) { //"The taxi arrived at the hotel."
            alertController.message = "sucess"
            write.saveComplet(target: sentenseExam!, sentenseKey: contentLabel.text!)
            setCompletLabel()
            
            let okAction = UIAlertAction(title: "확인", style: .default) { (result : UIAlertAction) -> Void in
                self.contentLabel?.text = self.write.getNoNextCompletKey(target: self.sentenseExam!)
            }
            alertController.addAction(okAction)
        }else {
            alertController.message = "fail : \(String(describing: origin))"
            contentLabel.text = ""
            let nextAction = UIAlertAction(title: "넘어가기", style: .default) { (result : UIAlertAction) -> Void in
                self.contentLabel?.text = self.write.getNoNextCompletKey(target: self.sentenseExam!)
            }
            let okAction = UIAlertAction(title: "다시도전", style: .default) { (result : UIAlertAction) -> Void in
                self.contentLabel?.text = ""
            }
            alertController.addAction(okAction)
            alertController.addAction(nextAction)
        }
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            compareWriteAndOrigin(writeTxt: textView.text)
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}
