//
//  ViewController.swift
//  Alura Viagens
//
//  Created by Jean Camargo on 06/01/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tabelaViagens: UITableView!
    
    @IBOutlet weak var viewHoteis: UIView!
    
    @IBOutlet weak var viewPacotes: UIView!
    
    
    let listaViagens: Array<Viagem> = ViagemDAO().retornaTodasAsViagens()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listaViagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let viagemAtual = listaViagens[indexPath.row]
        
        cell.textLabel?.text = viagemAtual.titulo
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tabelaViagens.dataSource = self
        
        self.viewPacotes.layer.cornerRadius = 10
        self.viewHoteis.layer.cornerRadius = 10
    }


}

