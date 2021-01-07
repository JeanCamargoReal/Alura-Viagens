//
//  ViewController.swift
//  Alura Viagens
//
//  Created by Jean Camargo on 06/01/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITabBarDelegate, UITableViewDelegate {
    
    @IBOutlet weak var tabelaViagens: UITableView!
    
    @IBOutlet weak var viewHoteis: UIView!
    
    @IBOutlet weak var viewPacotes: UIView!
    
    
    let listaViagens: Array<Viagem> = ViagemDAO().retornaTodasAsViagens()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listaViagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let viagemAtual = listaViagens[indexPath.row]
        
        cell.labelTitulo.text = viagemAtual.titulo
        cell.labelQuantidadeDeDias.text = "\(viagemAtual.quantidadeDeDias) dias"
        cell.labelPreco.text = viagemAtual.preco
        cell.imagemViagem.image = UIImage(named: viagemAtual.caminhoDaImagem)
        
        return cell
    }
    
    func tableView(_ tableViews: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tabelaViagens.dataSource = self
        self.tabelaViagens.delegate = self
        self.viewPacotes.layer.cornerRadius = 10
        self.viewHoteis.layer.cornerRadius = 10
    }


}

