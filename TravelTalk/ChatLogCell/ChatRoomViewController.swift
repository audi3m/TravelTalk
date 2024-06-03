//
//  ChatRoomViewController.swift
//  TravelTalk
//
//  Created by J Oh on 6/2/24.
//

import UIKit

class ChatRoomViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var messageTextField: UITextField!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var backgroundView: UIView!
    
    var chatRoom: ChatRoom?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = chatRoom?.chatRoomName ?? ""
        
        
        configureTableView()
        configureMessageField()
        
        messageTextField.delegate = self
        
        let recent = UIBarButtonItem(image: .arrowDown, style: .plain, target: self,
                                     action: #selector(goToRecent))
        navigationItem.rightBarButtonItem = recent
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        goToRecent(animated: false)
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        let userXib = UINib(nibName: UserChatRoomTableViewCell.id, bundle: nil)
        tableView.register(userXib, forCellReuseIdentifier: UserChatRoomTableViewCell.id)
        
        let othersXib = UINib(nibName: OthersChatLogTableViewCell.id, bundle: nil)
        tableView.register(othersXib, forCellReuseIdentifier: OthersChatLogTableViewCell.id)
        
    }
    
    @objc func goToRecent(animated: Bool) {
        if let lastIndex = chatRoom?.chatList.count {
            tableView.scrollToRow(at: IndexPath(row: lastIndex-1, section: 0), at: .bottom, animated: animated)
        }
    }
    
}

extension ChatRoomViewController: UITableViewDelegate, UITableViewDataSource {
    
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

// message textField
extension ChatRoomViewController: UITextFieldDelegate {
    
    func configureMessageField() {
        
        messageTextField.placeholder = "메세지를 입력하세요"
        messageTextField.borderStyle = .none
        
        sendButton.setImage(.paperplane, for: .normal)
        sendButton.tintColor = UIColor.placeholderText
        sendButton.addTarget(self, action: #selector(search), for: .touchUpInside)
        
        backgroundView.backgroundColor = .systemGray6
        backgroundView.layer.cornerRadius = 10
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        search()
        return true
    }
    
    @objc func search() {
        guard !messageTextField.text!.isEmpty else { return }
        let message = messageTextField.text!
        let date = Date.now.formatForChat()
        let chat = Chat(user: .user, date: date, message: message)
        chatRoom?.chatList.append(chat)
        
        messageTextField.text = ""
        
        tableView.reloadData()
        goToRecent(animated: true)
        
    }
    
    
    
}
