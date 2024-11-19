//
//  TableViewController.swift
//  Gabriel_rm87285_Roberto_rm86750_par
//
//  Created by Gabriel Ximenes on 18/11/24.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {

    
    var pessoas: [NSManagedObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
       
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Pessoa")
        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "nome", ascending: true)]
       
        do{
            pessoas = try managedContext.fetch(fetchRequest)
        }catch let error as NSError{
            print("Não foi possível buscar o dado \(error) \(error.userInfo)")
        }
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pessoas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let pessoa = pessoas[indexPath.row]
        // Configure the cell...
        cell.textLabel?.text = pessoa.value(forKey: "nome") as? String
       
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
            let managedContext = appDelegate.persistentContainer.viewContext
           
            managedContext.delete(pessoas[indexPath.row])
              
            do{
                try managedContext.save()
                pessoas.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }catch let error as NSError{
                print("Não foi possível buscar o dado \(error) \(error.userInfo)")
            }
            
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

}
