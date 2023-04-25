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
    
    @IBOutlet weak var txtNombreUsuario: NSTextField!
    @IBOutlet weak var txtID: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let usuarioActual = vc.usuarioLog
        idUsuarioActual = vc.idUsuarioActual    
        
        txtNombreUsuario.stringValue = "Bienvenido " + usuarioActual[idUsuarioActual].nombre
        
    }
    
    func verificarSiUsuarioExiste() -> Bool{
        if !vc.usuarioLog.isEmpty{
            return true;
        }
        return false;
    }
    
    @IBAction func irModificar(_ sender: NSButton) {
        idUsuarioActual = txtID.integerValue
            if verificarSiUsuarioExiste(){
                print("si hay usuarios")
                performSegue(withIdentifier: "irAModificar", sender: self)
            }
        }
        
        override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
            
            if segue.identifier == "irAModificar" {
                print("entra if prepare")
                
                
                let destinationVC = segue.destinationController as! ModificarUsuario;

                destinationVC.idDeUsuarioRecibido = idUsuarioActual
                print("valor id en menu: ",idUsuarioActual)
            }
        }
    
}
