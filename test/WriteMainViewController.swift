//
//  WriteMainViewController.swift
//  test
//
//  Created by USER on 2018. 11. 13..
//  Copyright © 2018년 USER. All rights reserved.
//

import UIKit

class WriteMainViewController: UIViewController {

    @IBOutlet var tableView:UITableView!
    
    private var sentenseArr: [SentenseProtocol] = []
    
//    lazy var testView:UIView = {
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        view.backgroundColor = UIColor.blue
//        return view
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let write = SentenseForWrite.sharedInstance
        sentenseArr = write.sentenseArr as! [SentenseProtocol]
        // Do any additional setup after loading the view.
        
//        view.addSubview(testView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}




extension WriteMainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sentenseArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "WriteItemTableViewCell")
        guard let itemCell = cell as? WriteItemTableViewCell else {
            return cell!
        }
        print("sentenseArr = \(String(describing: sentenseArr))")
        itemCell.setData(data: sentenseArr[indexPath.row])
        
//        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.none)
        
        return cell!
    }
}

extension WriteMainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tableView.deselectRow(at: indexPath, animated: true")
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = PraticeWritingViewController()
        vc.setModel(data: sentenseArr[indexPath.row])
        navigationController?.pushViewController(vc, animated:true)
    }
}

