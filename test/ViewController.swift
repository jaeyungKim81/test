//
//  ViewController.swift
//  test
//
//  Created by USER on 2018. 11. 13..
//  Copyright © 2018년 USER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let write = SentenseForWrite.sharedInstance
        let firstSentense = FirstSentense()
        var progress = write.getProgress(target: firstSentense as SentenseProtocol)
        print("progress = \(progress)")
        
        write.saveComplet(target: firstSentense as SentenseProtocol, sentenseKey: "그 택시는 호텔에 도착했다.")
        progress = write.getProgress(target: firstSentense as SentenseProtocol)
        print("progress = \(progress)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

