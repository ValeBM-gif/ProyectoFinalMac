//
//  RegistrarUsuario.swift
//  ProyectoFinal1
//
//  Created by Valeria Baeza on 19/04/23.
//

import Cocoa

class RegistrarUsuario: NSViewController {

    @IBOutlet weak var vc: ViewController!
    
    
    
    @IBOutlet weak var txtNombre: NSTextField!
    @IBOutlet weak var txtApellidoPaterno: NSTextField!
    @IBOutlet weak var txtApellidoMaterno: NSTextField!
    @IBOutlet weak var txtEmail: NSTextField!
    @IBOutlet weak var txtTelefono: NSTextField!
    @IBOutlet weak var txtGenero: NSTextField!
    @IBOutlet weak var txtPassword: NSTextField!
    @IBOutlet weak var txtConfirmarPassword: NSTextField!
    
    @IBOutlet weak var btnRegistrar: NSButton!
    
    @IBOutlet weak var lblCamposVacios: NSTextField!
    
    
    var flag:Bool = false
    var position:Int = 0
    @objc dynamic var usuarioLog:[UsuarioModelo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblCamposVacios.isHidden = true;
        
        for usuario in usuarioLog{
            print(usuario.nombre)
        }
        
        btnRegistrar.isEnabled = !flag
        
        if flag{
            txtNombre.stringValue = vc.usuarioLog[position].nombre
            txtApellidoPaterno.stringValue=vc.usuarioLog[position].apellidoPaterno
            txtApellidoMaterno.stringValue = vc.usuarioLog[position].apellidoMaterno
            txtEmail.stringValue=vc.usuarioLog[position].email
            txtTelefono.stringValue = vc.usuarioLog[position].telefono
            txtGenero.stringValue=vc.usuarioLog[position].genero
            txtPassword.stringValue = vc.usuarioLog[position].apellidoMaterno
            txtConfirmarPassword.stringValue=vc.usuarioLog[position].confirmarContraseña
        }
    }
    
    @IBAction func registrarUsuario(_ sender: NSButton) {
        
        if validarCamposVacios(){
            if validarPasswordsIguales(){
                lblCamposVacios.isHidden = true
                
                vc.usuarioLog.append(UsuarioModelo(position+1, txtNombre.stringValue, txtApellidoPaterno.stringValue, txtApellidoMaterno.stringValue, txtEmail.stringValue, txtTelefono.stringValue, txtGenero.stringValue, txtPassword.stringValue, txtConfirmarPassword.stringValue, ""))
                
                print("Agregaste")
                
                position += 1
                
                dismiss(self)
            }else{
                lblCamposVacios.stringValue = "Las contraseñas no coinciden"
                lblCamposVacios.isHidden = false
            }
            
            
        }else{
            lblCamposVacios.stringValue = "Recuerda llenar todos los campos"
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
            txtPassword.stringValue == "" ||
            txtConfirmarPassword.stringValue == "" {
            return false
        }
        return true
    }
    
    func validarPasswordsIguales()->Bool{
        if txtPassword.stringValue == txtConfirmarPassword.stringValue{
            return true
        }
        return false
    }
    
    @IBAction func cerrarViewController(_ sender: NSButton) {
        dismiss(self)
    }
    
    
    
    
}
