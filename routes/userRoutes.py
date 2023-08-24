from flask import Flask, jsonify, request
from flask import Blueprint
import controllers.userController as userController


user_api = Blueprint('user_api', __name__)

@user_api.route("/users", methods=['GET'])
def getUsuario():
    parametros = request.args
    email = parametros['email']
    password = parametros['password']
    result = userController.seleccionarUsuario(email,password)
    return jsonify({'result': result})

@user_api.route("/users", methods=['POST'])
def insertUser():
    parametros = request.args
    nombre = parametros['nombre']
    apellidos = parametros['apellidos']
    email = parametros['email']
    password = parametros['password']

    result = userController.insertarUser(nombre,apellidos,email,password)
    return jsonify({'result': result})

@user_api.route("/roles", methods=['GET'])
def selectRol():
    result = userController.seleccionarRol()
    return jsonify({'result': result})