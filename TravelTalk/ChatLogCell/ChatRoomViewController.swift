//
//  ChatRoomViewController.swift
//  TravelTalk
//
//  Created by J Oh on 6/2/24.
//

import UIKit

class ChatRoomViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var chatRoom: ChatRoom?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = chatRoom?.chatRoomName ?? ""
        
        configureTableView()
        
    }
    
    
    
    
    
    
}

extension ChatRoomViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        let userXib = UINib(nibName: UserChatRoomTableViewCell.id, bundle: nil)
        tableView.register(userXib, forCellReuseIdentifier: UserChatRoomTableViewCell.id)
        
        let othersXib = UINib(nibName: OthersChatLogTableViewCell.id, bundle: nil)
        tableView.register(othersXib, forCellReuseIdentifier: OthersChatLogTableViewCell.id)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chatRoom?.chatList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let chat = chatRoom?.chatList[indexPath.row] else { return UITableViewCell() }
        
        if chat.user == .user {
            let cell = tableView.dequeueReusableCell(withIdentifier: UserChatRoomTableViewCell.id, for: indexPath) as! UserChatRoomTableViewCell
            
            cell.configureData(chat: chat)
            
            
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: OthersChatLogTableViewCell.id, for: indexPath) as! OthersChatLogTableViewCell
            
            cell.configureData(chat: chat)
            
            
            return cell
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    
}
