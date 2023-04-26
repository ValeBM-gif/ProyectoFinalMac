//
//  ViewController.swift
//  ProyectoFinal1
//
//  Created by Valeria Baeza on 19/04/23.
//

import Cocoa

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        usuarioLog.append(UsuarioModelo(0, "Tula", "Resendiz", "Campos", "murmi@lasalle.com","477 123 4567", "no binarie", "123", "123","admin"))
        for usuario in usuarioLog{
            print(usuario.nombre)
        }
        lblIncorrecto.isHidden=true
    }
    
    override func viewDidAppear(){
        self.view.window?.title = "Iniciar sesión"
    }
    
    @IBOutlet weak var txtUsuario: NSTextField!
    @IBOutlet weak var txtPassword: NSTextField!
    @IBOutlet weak var lblIncorrecto: NSTextField!
    
    @objc dynamic var usuarioLog:[UsuarioModelo] = []
    
    var idUsuarioActual: Int!
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        //agregar
        if segue.identifier=="registrarUsuarioSegue"{
            (segue.destinationController as! RegistrarUsuario).vc = self
            
            
        }
        else if segue.identifier=="iniciarSesionCorrecto"{(segue.destinationController as! MenuAdmin).vc = self
            
        }
    }

    
    @IBAction func iniciarSesion(_ sender: NSButton) {
        let resultadoLogin = login(username: txtUsuario.stringValue, password: txtPassword.stringValue)
               
               if(resultadoLogin is UsuarioModelo){
                   lblIncorrecto.isHidden = true
                   let UsuarioActual = resultadoLogin as! UsuarioModelo
                   idUsuarioActual=UsuarioActual.id
                   performSegue(withIdentifier: "iniciarSesionCorrecto", sender: self)
               }
               else{
                   lblIncorrecto.isHidden = false;
               }
    }
    

    func login(username: String, password: String) -> Any {
        for UsuarioModelo in usuarioLog {
            if (UsuarioModelo.nombre == username && UsuarioModelo.contraseña == password) {
                return UsuarioModelo
            }
        }
        return false
    }

    


}

