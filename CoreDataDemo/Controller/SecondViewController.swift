//
//  SecondViewController.swift
//  CoreDataDemo
//
//  Created by Vaishnavi Sasane on 27/06/19.
//  Copyright © 2019 Vaishnavi Sasane. All rights reserved.
//

import UIKit


protocol DataPassDelegate {
    func data(object: [String: String],index: Int,isfromEdit: Bool)
    }


class SecondViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var student = [Student]()
    
    var delegate:DataPassDelegate?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        student = DataBaseHelper.sharedInstance.getData()
        
        // Do any additional setup after loading the view.
    }
    
}

//MARK: TableView Methods

extension SecondViewController: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return student.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        cell.student = student[indexPath.row]
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        //swipe or click on delete will delete the data
        
        if editingStyle == .delete {
            
                self.student = DataBaseHelper.sharedInstance.deleteData(index: indexPath.row)
                
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        
        
        
//If you want to ask user before deleting data
        
//        if editingStyle == .delete {
//
//            let alert = UIAlertController.init(title: "Alert", message: "Do you want to delete data?", preferredStyle: .alert)
//
//            let yes =   UIAlertAction.init(title: "YES", style: .default) { (UIAlertAction) in
//
//                self.student = DataBaseHelper.sharedInstance.deleteData(index: indexPath.row)
//
//                self.tableView.deleteRows(at: [indexPath], with: .automatic)
//            }
//
//            let no = UIAlertAction.init(title: "NO", style: .default) { (UIAlertAction) in
//
//                self.dismiss(animated: true, completion: nil)
//            }
//
//            alert.addAction(yes)
//
//            alert.addAction(no)
//
//            self.present(alert, animated: true, completion: nil)
//        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dict = ["name":student[indexPath.row].name,"address":student[indexPath.row].address,"city":student[indexPath.row].city,"mobile":student[indexPath.row].mobile]
        
        delegate?.data(object: dict as! [String : String], index: indexPath.row, isfromEdit: true)
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
