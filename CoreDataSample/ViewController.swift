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
    }

    //MARK:- Create core data object.
    
    func createUser() {
      
        let user = User(context: persistenceManager.context)
        user.name = "SBulla"
        persistenceManager.save()
    }


    
    func getUsers(){
        let users = persistenceManager.fetch(User.self)
        users.forEach({ print($0.name) })
    }
    
    
}

