//
//  CadastroViewController.swift
//  roberto_rm86750_gabriel_rm87285
//
//  Created by Gabriel Ximenes on 18/11/24.
//

import UIKit
import CoreData

class CadastroViewController: UIViewController {
    

    @IBOutlet weak var txtNome: UITextField!
    
    
    @IBOutlet weak var txtCep: UITextField!
    @IBOutlet weak var txtEndereco: UITextField!
    @IBOutlet weak var txtIdade: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func salvar(_ sender: Any) {
        save(nome: txtNome.text!, idade: Int(txtIdade.text!)!, endereco: txtEndereco.text!,
             cep: txtCep.text!)
        self.navigationController?.popViewController(animated: true)
    }
    
    func save(nome: String, idade: Int, endereco: String, cep: String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let entidade = NSEntityDescription.entity(forEntityName: "Pessoa", in: managedContext)!
        
        //inicio do processo de gravação
        let pessoa = NSManagedObject(entity: entidade, insertInto: managedContext)
        pessoa.setValue(nome, forKey: "nome")
        pessoa.setValue(idade, forKey: "idade")
        pessoa.setValue(endereco, forKey: "endereco")
        pessoa.setValue(cep, forKey: "cep")
        
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("Não foi possível salvar \(error) \(error.userInfo)")
        }
    }
    

}
