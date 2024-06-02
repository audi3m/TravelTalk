//
//  UserChatRoomTableViewCell.swift
//  TravelTalk
//
//  Created by J Oh on 6/2/24.
//

import UIKit

class UserChatRoomTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var chatLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureUI()
        
    }

    func configureUI() {
        
    }
    
    
    func configureData(chat: Chat) {
        timeLabel.text = String(chat.date.suffix(5))
        
        
        chatLabel.text = chat.message
        chatLabel.numberOfLines = 0
    }
    
}
