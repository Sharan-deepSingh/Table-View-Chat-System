//
//  ViewController.swift
//  Table View Chat System
//
//  Created by user on 15/06/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var messages: [Message] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "MessageCell")
    }
    
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        messageTextField.endEditing(true)
    }
    
}

//MARK: - UITableViewDataSouece


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as! MessageCell
        cell.messageLabel.text = messages[indexPath.row].message
        return cell
    }
}

//MARK: - UITextFieldDelegate


extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        messageTextField.endEditing(true)
        
        return false
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if messageTextField.text != "" {
            messageTextField.placeholder = "Type something..."
            return true
        } else {
            messageTextField.placeholder = "Please enter something first..."
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        tableView.beginUpdates()
        messages.append(Message(userName: "xyz", message: messageTextField.text ?? "error while fetching the message"))
        tableView.insertRows(at: [IndexPath(row: messages.count - 1, section: 0)], with: .fade)
        tableView.endUpdates()
        messageTextField.text = ""
    }
}

