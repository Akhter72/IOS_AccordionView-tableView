//
//  MyTableViewCell.swift
//  AccordionView
//
//  Created by Ideas2IT on 24/05/23.
//

import UIKit

class myButton : UIButton{
    var indexpath : IndexPath?
    var cell: MyTableViewCell?
}

class MyTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var celBtn: myButton!
    var indexpath: IndexPath?
    @IBOutlet weak var cellData: UITextField!
//    @IBAction func editButton(_ sender: UIButton) {
//        cellData.isUserInteractionEnabled = !cellData.isEditing
//        if cellData.isUserInteractionEnabled {
//            self.backgroundColor = .lightGray
//            cellData.textColor = .white
//            sender.tintColor = .white
//            cellData.becomeFirstResponder()
//            let newImage = UIImage(systemName: "checkmark")
//            sender.setImage(newImage, for: .normal)
//        } else {
//            self.backgroundColor = .white
//            cellData.textColor = .black
//            sender.tintColor = .blue
//            let originalImage = UIImage(systemName: "pencil")
//            sender.setImage(originalImage, for: .normal)
//        }
//
//    }
    
    func changeMethod(sender: myButton){
        
        cellData.isUserInteractionEnabled = !cellData.isUserInteractionEnabled
        if cellData.isUserInteractionEnabled {
                self.backgroundColor = .lightGray
                cellData.textColor = .white
//                sender.tintColor = .white
                cellData.becomeFirstResponder()
//                let newImage = UIImage(systemName: "checkmark")
//                sender.setImage(newImage, for: .normal)
        } else {
                self.backgroundColor = .white
                cellData.textColor = .black
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        cellData.borderStyle = .none
        cellData.isUserInteractionEnabled = false
        
//        self.selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        // Configure the view for the selected state
    }
    
}
