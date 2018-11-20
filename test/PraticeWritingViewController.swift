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

        write.saveComplet(target: sentenseExam!, sentenseKey: "")
//        contentLabel?.text = write.getNoNextCompletKey(target: sentenseExam!)
        contentLabel?.text = write.getNoRandomCompletKey(target: sentenseExam!)
        setCompletLabel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (write.isAllComplet(target: sentenseExam!)) {
           let alertController =  UIAlertController(title: "", message: "Already complet", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "확인", style: .default) { (result : UIAlertAction) -> Void in
                self.navigationController!.popViewController(animated: true)
            }
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
    }

    @IBAction func testBtnAction(_ sender: Any) {
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
            
            write.saveComplet(target: sentenseExam!, sentenseKey: contentLabel.text!)
            let allComplet = self.write.isAllComplet(target: self.sentenseExam!)
            setCompletLabel()
            
            if allComplet {
                alertController.message = "congratulation all complet"
            }else {
                alertController.message = "sucess"
                let okAction = UIAlertAction(title: "확인", style: .default) { (result : UIAlertAction) -> Void in
                    
                    if !(allComplet) {
                        self.contentLabel.text = ""
                        self.writeTextView.text = ""
                        //                self.contentLabel?.text = self.write.getNoNextCompletKey(target: self.sentenseExam!)
                        self.contentLabel?.text = self.write.getNoRandomCompletKey(target: self.sentenseExam!)
                    }
                }
                alertController.addAction(okAction)
            }
            
        }else {
            alertController.message = "fail : \(String(describing: origin))"
            let nextAction = UIAlertAction(title: "넘어가기", style: .default) { (result : UIAlertAction) -> Void in

                self.contentLabel.text = ""
//                self.contentLabel?.text = self.write.getNoNextCompletKey(target: self.sentenseExam!)
                self.contentLabel?.text = self.write.getNoRandomCompletKey(target: self.sentenseExam!)
                self.writeTextView.text = ""
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
