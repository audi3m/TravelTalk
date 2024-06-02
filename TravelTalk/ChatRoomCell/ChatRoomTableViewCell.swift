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
        chatLabel.text = chatRoom.chatList.first?.message
        dateLabel.text = "88.88.88"
        
    }
    
    
    
    
}

//ChatRoom(chatroomId: 1,
//         chatroomImage: [User.hue.profileImage, User.jack.profileImage, User.bran.profileImage, User.den.profileImage],
//         chatroomName: "영등포 멘토방",
//         chatList: [
//            Chat(user: .hue,
//                 date: "2024-06-12 21:30",
//                 message: "열심히 일 하시고 계시는거죠?"),
//            Chat(user: .bran,
//                 date: "2024-06-12 22:32",
//                 message: "영등포 캠퍼스 가고싶어요..."),
//            Chat(user: .jack,
//                 date: "2024-06-12 22:38",
//                 message: "화이팅!!"),
//            Chat(user: .den,
//                 date: "2024-06-12 23:42",
//                 message: "열심히 하고 있습니다!!"),
//         ]
//        )
