//
//  MessageCell.swift
//  Table View Chat System
//
//  Created by user on 15/06/23.
//

import UIKit

class MessageCell: UITableViewCell {


    @IBOutlet weak var messageUserImage: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageBubble: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height / 5
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
