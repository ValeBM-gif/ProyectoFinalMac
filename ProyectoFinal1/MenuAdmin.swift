//
//  MenuAdmin.swift
//  ProyectoFinal1
//
//  Created by Diego Juárez on 25/04/23.
//

import Cocoa

class MenuAdmin: NSViewController {

    @IBOutlet weak var vc: ViewController!
    
    var idUsuarioActual:Int!
    var idUsuarioAModificar:Int=0
    
    @IBOutlet weak var txtNombreUsuario: NSTextField!
    @IBOutlet weak var txtID: NSTextField!
    @IBOutlet weak var lblIDIncorrecto: NSTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblIDIncorrecto.isHidden = true
        
        let usuarioActual = vc.usuarioLog
        idUsuarioActual = vc.idUsuarioActual    
        print("num de usuarios",vc.usuarioLog.count)
        
        txtNombreUsuario.stringValue = "Bienvenido " + usuarioActual[idUsuarioActual].nombre
        
    }
    
    @IBAction func irModificar(_ sender: NSButton) {
        idUsuarioAModificar = txtID.integerValue
        
            if verificarSiUsuarioExiste(){
                print("si hay usuarios y si es id válido")
                performSegue(withIdentifier: "irAModificar", sender: self)
            }
        }
    
    func verificarSiUsuarioExiste() -> Bool{
        if !vc.usuarioLog.isEmpty{
            print("log no esta vacío")
            print("usuario log count",vc.usuarioLog.count)
            print("id usuario a modificar",idUsuarioAModificar)
            return checarExistenciaUsuario(id: idUsuarioAModificar)
        }
        return false;
    }
    
    func checarExistenciaUsuario(id:Int) -> Bool{
        for UsuarioModelo in vc.usuarioLog {
            if (UsuarioModelo.id == id ) {
                lblIDIncorrecto.isHidden = true
                return true
            }
        }
        lblIDIncorrecto.isHidden = false
        return false
    }
        
        override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
            
            if segue.identifier == "irAModificar" {
                print("entra if prepare")
                
                (segue.destinationController as! ModificarUsuario).vc = self.vc
                
                let destinationVC = segue.destinationController as! ModificarUsuario;

                destinationVC.idDeUsuarioRecibido = idUsuarioAModificar
                print("valor id en menu: ",idUsuarioAModificar)
            }
        }
    
}
