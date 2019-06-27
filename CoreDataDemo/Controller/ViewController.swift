//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Vaishnavi Sasane on 26/06/19.
//  Copyright © 2019 Vaishnavi Sasane. All rights reserved.
//

import UIKit

class ViewController: UIViewController,DataPassDelegate {
    func data(object: [String : String], index: Int, isfromEdit: Bool) {
        txtName.text = object["name"]
        txtAddress.text = object["address"]
        txtCity.text = object["city"]
        txtMobile.text = object["mobile"]
        
        selectedIndex = index
        
        isUpdated = isfromEdit
    }
    

    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtName: UITextField!
    
    var selectedIndex = Int()
    
    var isUpdated = Bool()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func saveClicked(_ sender: Any) {
        
        let dict = ["name":txtName.text,"address":txtAddress.text,"city":txtCity.text,"mobile":txtMobile.text]
     
        if isUpdated{
            DataBaseHelper.sharedInstance.editData(object: dict as! [String : String], editAtIndex: selectedIndex)
        }else{
            DataBaseHelper.sharedInstance.save(object: dict as! [String : String])
        }
    }
    
    @IBAction func showClicked(_ sender: Any) {
        
        let secVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secVC.delegate = self
        self.navigationController?.pushViewController(secVC, animated: true)
    }
}

