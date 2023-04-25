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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let usuarioActual = vc.usuarioLog
        idUsuarioActual = vc.idUsuarioActual    
        
        txtNombreUsuario.stringValue = "Bienvenido " + usuarioActual[idUsuarioActual].nombre
        
    }
    
}
