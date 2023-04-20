//
//  ViewController.swift
//  ProyectoFinal1
//
//  Created by Valeria Baeza on 19/04/23.
//

import Cocoa

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        usuarioLog.append(UsuarioModelo(0, "Tulador", "Resendiz", "Campos", "murmi@lasalle.com","477 123 4567", "no binarie", "123", "123","versatil"))
    }
    
    
    @IBOutlet weak var txtUsuario: NSTextField!
    
    @IBOutlet weak var txtPassword: NSTextField!
    
    @objc dynamic var usuarioLog:[UsuarioModelo] = []
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        //agregar
        if segue.identifier=="registrarUsuarioSegue"{
            (segue.destinationController as! RegistrarUsuario).vc = self
        }
    }
    
    
    
    @IBAction func iniciarSesion(_ sender: NSButton) {
        
    }
    
    //a
    


}

