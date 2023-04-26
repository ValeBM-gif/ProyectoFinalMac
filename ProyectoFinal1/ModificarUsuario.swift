//
//  ModificarUsuario.swift
//  ProyectoFinal1
//
//  Created by Valeria Baeza on 20/04/23.
//

import Cocoa

class ModificarUsuario: NSViewController {

    @IBOutlet weak var vc: ViewController!

    
    @IBOutlet weak var txtNombre: NSTextField!
    @IBOutlet weak var txtApellidoPaterno: NSTextField!
    @IBOutlet weak var txtApellidoMaterno: NSTextField!
    @IBOutlet weak var txtEmail: NSTextField!
    @IBOutlet weak var txtTelefono: NSTextField!
    @IBOutlet weak var txtGenero: NSTextField!
    @IBOutlet weak var txtRol: NSTextField!
    
    @IBOutlet weak var lblCamposVacios: NSTextField!
    
    @IBOutlet weak var btnActualizar: NSButton!
    
    var flag:Bool = true
    var position:Int = 0
    var idDeUsuarioRecibido:Int = 0
    var idUsuarioAModificar:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblCamposVacios.isHidden = true
        
        print("id usuario a modificar",idUsuarioAModificar)
        btnActualizar.isEnabled = flag
        
        let usuarioActual = vc.usuarioLog
        idDeUsuarioRecibido = vc.idUsuarioActual
        
        print("nombre usuario a modificar:",vc.usuarioLog[idUsuarioAModificar].nombre)
        
        if flag{
            txtNombre.stringValue = vc.usuarioLog[idUsuarioAModificar].nombre
            txtApellidoPaterno.stringValue=vc.usuarioLog[idUsuarioAModificar].apellidoPaterno
            txtApellidoMaterno.stringValue = vc.usuarioLog[idUsuarioAModificar].apellidoMaterno
            txtEmail.stringValue=vc.usuarioLog[idUsuarioAModificar].email
            txtTelefono.stringValue = vc.usuarioLog[idUsuarioAModificar].telefono
            txtGenero.stringValue=vc.usuarioLog[idUsuarioAModificar].genero
            txtRol.stringValue = vc.usuarioLog[idUsuarioAModificar].rol
        }
    }
    
    @IBAction func actualizarUsuario(_ sender: NSButton) {
        
        if validarCamposVacios(){
            
            lblCamposVacios.isHidden = true
            
            vc.usuarioLog[idUsuarioAModificar].nombre = txtNombre.stringValue
            vc.usuarioLog[idUsuarioAModificar].apellidoMaterno = txtApellidoMaterno.stringValue
            vc.usuarioLog[idUsuarioAModificar].apellidoPaterno = txtApellidoPaterno.stringValue
            vc.usuarioLog[idUsuarioAModificar].email = txtEmail.stringValue
            vc.usuarioLog[idUsuarioAModificar].telefono = txtTelefono.stringValue
            vc.usuarioLog[idUsuarioAModificar].genero = txtGenero.stringValue
            vc.usuarioLog[idUsuarioAModificar].rol = txtRol.stringValue
            dismiss(self)
        }else{
            lblCamposVacios.isHidden = false
        }
        
        
    }
    
    func validarCamposVacios()->Bool{
        if txtNombre.stringValue == "" ||
            txtApellidoPaterno.stringValue == "" ||
            txtApellidoMaterno.stringValue == "" ||
            txtEmail.stringValue == "" ||
            txtTelefono.stringValue == "" ||
            txtGenero.stringValue == "" ||
            txtRol.stringValue == "" {
            return false
        }
        return true
    }
    
    @IBAction func cerrarViewController(_ sender: NSButton) {
        dismiss(self)
    }
    
    
}
