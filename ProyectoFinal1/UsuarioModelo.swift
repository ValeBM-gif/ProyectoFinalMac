//
//  UsuarioModelo.swift
//  ProyectoFinal1
//
//  Created by Valeria Baeza on 19/04/23.
//

import Cocoa

class UsuarioModelo: NSObject {
    
    @objc dynamic var id: Int
    @objc dynamic var nombre:String
    @objc dynamic var apellidoPaterno:String
    @objc dynamic var apellidoMaterno:String
    @objc dynamic var email:String
    @objc dynamic var telefono:String
    @objc dynamic var genero:String
    @objc dynamic var contraseña:String
    @objc dynamic var confirmarContraseña:String
    @objc dynamic var rol:String
    
    init(_ id: Int,_ nombre: String,_ apellidoPaterno: String,_ apellidoMaterno: String,_ email: String,_ telefono: String,_ genero: String,_ contraseña: String,_ confirmarContraseña: String,_ rol: String) {
        self.id = id
        self.nombre = nombre
        self.apellidoPaterno = apellidoPaterno
        self.apellidoMaterno = apellidoMaterno
        self.email = email
        self.telefono = telefono
        self.genero = genero
        self.contraseña = contraseña
        self.confirmarContraseña = confirmarContraseña
        self.rol = rol
    }
    
}
