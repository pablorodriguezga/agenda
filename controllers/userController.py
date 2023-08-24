from db import conectar
from models import Usuario
from models import Roles

def seleccionarUsuario(email,password):
    session = conectar()
    usuarios = session.query(Usuario).filter(Usuario.email == email, Usuario.password == password).all()
    return usuarios

def insertarUser(nombre,apellidos,email,password,rol_id):
    try:
        user = Usuario(
            nombre=nombre,
            apellidos=apellidos,
            email=email,
            password=password,
            rol_id=rol_id
        )
        session = conectar()
        session.add(user)
        session.commit()
    except Exception as e:
        print(e)
        return False
    finally:
        session.close()
    return True

def seleccionarRol():
    try:
        session = conectar()
        roles = session.query(Roles).all()[0]
    except Exception as e:
        print(e)
    finally:
        session.close()
    return roles