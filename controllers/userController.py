from db import conectar
from models import Usuario
from models import Roles

def seleccionarUsuario(email,password):
    user_info = {"id": 0, "id_rol": None}
    usuarios = session.query(Usuario).filter(Usuario.email == email, Usuario.password == password).all()
    try:
        session = conectar()
        if len(usuarios) > 0:
            user_info["id"] = usuarios[0].id
            user_info["id_rol"] = usuarios[0].id_rol
    except Exception as e:
        print(e)
    finally:
        session.close()
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