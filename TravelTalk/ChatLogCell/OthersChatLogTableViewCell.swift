//
//  OthersChatLogTableViewCell.swift
//  TravelTalk
//
//  Created by J Oh on 6/2/24.
//

import UIKit

class OthersChatLogTableViewCell: UITableViewCell {
    
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var chatBackground: UIView!
    @IBOutlet var chatLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureUI()
        
        
        
    }

    func configureUI() {
        profileImageView.backgroundColor = .systemGray6
        profileImageView.layer.cornerRadius = 25
        
        chatBackground.layer.borderWidth = 1
        chatBackground.layer.cornerRadius = 10
        
    }
    
    func configureData(chat: Chat) {
        profileImageView.image = UIImage(named: chat.user.profileImage)
        nameLabel.text = chat.user.rawValue
        chatLabel.text = chat.message
        
        
    }
    
}
