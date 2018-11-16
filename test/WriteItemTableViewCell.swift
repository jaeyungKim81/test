//
//  WriteItemTableViewCell.swift
//  test
//
//  Created by USER on 2018. 11. 14..
//  Copyright © 2018년 USER. All rights reserved.
//

import UIKit

class WriteItemTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel?
    var dataModel:SentenseProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        print("Configure the view for the selected state")
    }

    func  setData(data:SentenseProtocol){
        dataModel = data
        titleLabel?.text = data.title
    }
    
}
