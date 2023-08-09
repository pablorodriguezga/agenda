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