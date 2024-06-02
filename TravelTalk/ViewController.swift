//
//  ViewController.swift
//  TravelTalk
//
//  Created by J Oh on 6/2/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchBarckground: UIView!
    @IBOutlet var magImageView: UIImageView!
    @IBOutlet var searchTextField: UITextField!
    
    
    let list = mockChatList
    var filterdList: [ChatRoom] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "TRAVEL TALK"
        filterdList = list
        
        configureTableView()
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBarckground.backgroundColor = .systemGray6
        searchBarckground.layer.cornerRadius = 10
        
        magImageView.image = UIImage(systemName: "magnifyingglass")
        magImageView.tintColor = .placeholderText
        
        searchTextField.placeholder = "친구 이름을 검색해보세요"
        searchTextField.borderStyle = .none
        searchTextField.backgroundColor = .clear
        
        let xib = UINib(nibName: ChatRoomTableViewCell.id, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: ChatRoomTableViewCell.id)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filterdList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatRoomTableViewCell.id, for: indexPath) as! ChatRoomTableViewCell
        let chatRoom = filterdList[indexPath.row]
        cell.configureData(chatRoom: chatRoom)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatRoom = filterdList[indexPath.row]
        let sb = UIStoryboard(name: "ChatRoom", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: ChatRoomViewController.id) as! ChatRoomViewController
        vc.chatRoom = chatRoom
        navigationController?.pushViewController(vc, animated: true)
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    
}







