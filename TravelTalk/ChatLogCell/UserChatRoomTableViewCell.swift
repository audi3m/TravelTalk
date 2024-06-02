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
    
    @IBOutlet var chatBackground: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureUI()
        
    }

    func configureUI() {
        
        chatBackground.backgroundColor = .systemGray6
        chatBackground.layer.borderWidth = 1
        chatBackground.layer.cornerRadius = 10
        
        chatLabel.font = .systemFont(ofSize: 13)
        chatLabel.numberOfLines = 0
        
        timeLabel.textColor = .lightGray
    }
    
    
    func configureData(chat: Chat) {
        timeLabel.text = chat.timeFormatted
        timeLabel.textColor = .lightGray
        
        
        chatLabel.text = chat.message
        chatLabel.numberOfLines = 0
    }
    
}
    
     
