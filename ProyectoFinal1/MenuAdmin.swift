//
//  MenuAdmin.swift
//  ProyectoFinal1
//
//  Created by Diego Juárez on 25/04/23.
//

import Cocoa

class MenuAdmin: NSViewController {

    @IBOutlet weak var vc: ViewController!

    @IBOutlet weak var txtNombreUsuario: NSTextField!
    @IBOutlet weak var txtID: NSTextField!
    @IBOutlet weak var lblIDIncorrecto: NSTextField!
    
    var idUsuarioActual:Int!
    var idUsuarioAModificar:Int=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblIDIncorrecto.isHidden = true
        
        let usuarioActual = vc.usuarioLog
        idUsuarioActual = vc.idUsuarioActual    
        print("num de usuarios",vc.usuarioLog.count)
        
        txtNombreUsuario.stringValue = "Bienvenido " + usuarioActual[idUsuarioActual].nombre
        
    }
    
    @IBAction func irModificar(_ sender: NSButton) {

        if txtID.stringValue != ""{
            lblIDIncorrecto.isHidden = true
            idUsuarioAModificar = txtID.integerValue
            if verificarSiUsuarioLogVacio(){
                print("si hay usuarios y si es id válido")
                
            }
        }else{
            lblIDIncorrecto.isHidden = false
        }
        
            
        }
    
    func verificarSiUsuarioLogVacio() -> Bool{
        if !vc.usuarioLog.isEmpty{
            return checarExistenciaUsuario(id: idUsuarioAModificar)
        }
        return false;
    }
    
    func checarExistenciaUsuario(id:Int) -> Bool{
        for UsuarioModelo in vc.usuarioLog {
            if (UsuarioModelo.id == id ) {
                print("entra a forrrrrrrr")
                lblIDIncorrecto.isHidden = true
                performSegue(withIdentifier: "irAModificar", sender: self)
                return true
                
            }
        }
        lblIDIncorrecto.isHidden = false
        return false
    }
        
    @IBAction func irARegistro(_ sender: NSButton) {
        
        performSegue(withIdentifier: "iniciarSesionCorrecto", sender: self)
        
    
        
    }
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
            
            if segue.identifier == "irAModificar" {
                print("entra if prepare")
                
                (segue.destinationController as! ModificarUsuario).vc = self.vc
                
                let destinationVC = segue.destinationController as! ModificarUsuario;

                destinationVC.idDeUsuarioRecibido = idUsuarioActual
                destinationVC.idUsuarioAModificar = idUsuarioAModificar
                print("valor id en menu: ",vc.usuarioLog[idUsuarioAModificar].id)
            }
        else   if segue.identifier=="irARegistrar"{
            (segue.destinationController as! RegistrarUsuario).vc = self.vc
            
            
        }
            
            }
        }
    

