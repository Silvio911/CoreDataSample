//
//  ViewController.swift
//  CoreDataSample
//
//  Created by Silvio Bulla on 05/11/2018.
//  Copyright © 2018 Silvio Bulla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let persistenceManager:  PersistenceManager
    
    var users = [User]()
    
    init(persistenceManager: PersistenceManager) {
            self.persistenceManager = persistenceManager
            super.init(nibName: nil, bundle: nil)
    } 
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        createUser()
        getUsers()
        deleteUser()
    }
    
    func printUsers(){
        users.forEach({ print($0.name) })
    }

    //MARK:- Create core data object.
    
    func createUser() {
        let user = User(context: persistenceManager.context)
        user.name = "Silvio"

        persistenceManager.save()
    }
    
    //MARK:- Fetch.

    func getUsers(){
        let users = persistenceManager.fetch(User.self)
        
        self.users = users
        printUsers()
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.updateUser()
        }
    }
    
    //MARK:- Update.
    
    func updateUser(){
        guard let firstUser = users.first else {return}
        
        firstUser.name = "Modified " + firstUser.name
        persistenceManager.save()
        printUsers()
    }
    
    //MARK:- Delete.

    func deleteUser() {
        guard let firstUser = users.first else { return }
        
        persistenceManager.delete(firstUser)
        printUsers()
    }
    
}

