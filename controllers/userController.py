from db import conectar
from models import Usuario
from models import Roles

def seleccionarUsuario(email, password):
    user_info = {"id": 0, "id_rol": None}
    try:
        session = conectar()
        usuarios = session.query(Usuario).filter(Usuario.email == email, Usuario.password == password).all()
        if len(usuarios) > 0:
            user_info["id"] = usuarios[0].id
            user_info["id_rol"] = usuarios[0].id_rol
    except Exception as e:
        print(e)
    finally:
        session.close()
    return user_info

def insertarUser(nombre,apellidos,email,password,id_rol):
    try:
        user = Usuario(
            nombre=nombre,
            apellidos=apellidos,
            email=email,
            password=password,
            id_rol=id_rol
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
        roles = session.query(Roles).all()
    except Exception as e:
        print(e)
    finally:
        session.close()
    return roles