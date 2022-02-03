//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    var listenerDB: ListenerRegistration!
    
    let db = Firestore.firestore()
    
    let alert = ErrorMessage()
    
    var messages: [Message ] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alert.delegate = self
        // tableView.delegate = self
        tableView.dataSource = self
        title = K.appName
        navigationItem.hidesBackButton = true
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellId)
        loadMessages()
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
        guard messageTextfield.text != "" else {
            alert.show("Empty Message", "Please Type Something")
            return
        }
        
        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email {
            self.messageTextfield.text = ""
            db.collection(K.FStore.collectionName)
                .addDocument(data: [K.FStore.senderField: messageSender, K.FStore.bodyField: messageBody, K.FStore.dateField: Date.now], completion: { error in
                    if let err = error {
                        self.alert.show("DB mistake", err)
                        print("ChatView:41: Error", err)
                    } else {
                        print("ChatView:43: Successfully saved data")
                    }
                })
        }
    }
    
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        defer {
            listenerDB.remove()
        }
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
            alert.show("SignOut Error", signOutError)
        }
    }
    
    func loadMessages() {
        
        listenerDB = db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField, descending: true)
            .addSnapshotListener { snapshot, error in
                if let err = error {
                    self.alert.show("DB download mistake", err)
                    print("ChatView:67: DB download Error", err)
                } else {
                    self.messages = []
                    snapshot?.documents.forEach{ el in
                        let data = el.data()
                        if  let sender = data[K.FStore.senderField] as? String, let message = data[K.FStore.bodyField] as? String, let time = data[K.FStore.dateField] as? Timestamp {
                            self.messages.append(Message(sender: sender, body: message, time: time))
                            print("HERE:---> ", message)
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                //indexPath for bottom oder
                                // let indexPath = IndexPath(row: self.messages.count - 1 , section: 0)
                                let indexPath = IndexPath(row: 0, section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                            }
                        }
                        print("ChatView:70:", data)
                    }
                }
            }
    }
    
}


extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = messages[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellId, for: indexPath) as! MessageCell
        cell.label.text = message.body
        
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            cell.label.textColor = UIColor(named: K.BrandColors.purple)
        } else {
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.purple)
            cell.label.textColor = UIColor(named: K.BrandColors.lightPurple)
        }
        
        
        return cell
    }
}

