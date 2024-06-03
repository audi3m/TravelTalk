//
//  ChatRoomTableViewCell.swift
//  TravelTalk
//
//  Created by J Oh on 6/2/24.
//

import UIKit

class ChatRoomTableViewCell: UITableViewCell {
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var chatLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
        
    }
    
    func configureUI() {
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = 25
        
        nameLabel.font = .boldSystemFont(ofSize: 14)
        
        chatLabel.font = .systemFont(ofSize: 13)
        chatLabel.textColor = .gray
        chatLabel.numberOfLines = 2
        
        dateLabel.font = .systemFont(ofSize: 13)
        dateLabel.textColor = .gray
        dateLabel.textAlignment = .right
        
    }
    
    func configureData(chatRoom: ChatRoom) {
        profileImageView.image = UIImage(named: chatRoom.chatRoomImage.first!)
        nameLabel.text = chatRoom.chatRoomName
        chatLabel.text = chatRoom.chatList.last?.message
        dateLabel.text = chatRoom.chatList.last?.dateFormatted
        
    }
    
}
