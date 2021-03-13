//
//  NameInsertPopUp.swift
//  MemoryGame
//
//  Created by Rodrigo Gaspar on 13/03/21.
//

import UIKit

class InserNamePopUp: UIView {
    
    /* **************************************************************************************************
     **
     **  MARK: Variables declaration
     **
     ****************************************************************************************************/

    var nameLabel : UILabel!
    
    var nameTextField : UITextField!
    
    var saveButton : UIButton!

    /* **************************************************************************************************
     **
     **  MARK: Init
     **
     ****************************************************************************************************/
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let width = frame.size.width
        let height = frame.size.height
        
        self.backgroundColor = .white
        
        self.layer.cornerRadius = 30

        self.layer.shadowOffset.width = 0
        self.layer.shadowOffset.height = 2
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        
        var yPosition = height*0.075
        
        //------------------------- Name LAbel -----------------------------
        
        nameLabel = UILabel(frame: CGRect(x: 0, y: yPosition, width: width*0.9, height: 0))
        nameLabel.text = "Please, tell us your nickname".localized
        nameLabel.textColor = .black
        nameLabel.font = UIFont.defaultFont(size: 16, type: .regular)
        nameLabel.numberOfLines = 0
        nameLabel.lineBreakMode = .byTruncatingTail
        nameLabel.sizeToFit()
        nameLabel.center.x = width/2
        nameLabel.textAlignment = .center
        
        addSubview(nameLabel)
        
        yPosition = yPosition + nameLabel.frame.height + 20
        
        //------------------------- Name Text Field -----------------------------
        
        nameTextField = UITextField(frame: CGRect(x: 0, y: yPosition, width: width*0.9, height: 40))
        nameTextField.backgroundColor = .clear
        nameTextField.layer.cornerRadius = 12
        nameTextField.layer.borderWidth = 1
        nameTextField.layer.borderColor = UIColor.black.cgColor
        nameTextField.center.x = width/2
        nameTextField.textColor = .black
        nameTextField.autocorrectionType = .no
        nameTextField.autocapitalizationType = .none
        nameTextField.font = UIFont.defaultFont(size: 16, type: .regular)
        nameTextField.textAlignment = .center
        
        addSubview(nameTextField)
        
        yPosition = yPosition + nameTextField.frame.height + 20
        
        //-------------------------Save Button-----------------------------
        
        saveButton = UIButton(frame: CGRect(x: 0, y: yPosition, width: width*0.6, height: 40))
        saveButton.backgroundColor = .black
        saveButton.setTitle("Save".localized, for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.center.x = width/2
        saveButton.titleLabel?.font = UIFont.defaultFont(size: 16, type: .regular)
        saveButton.layer.cornerRadius = 12
        
        addSubview(saveButton)
        
        
 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



