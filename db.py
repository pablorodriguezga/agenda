from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker


DATABASE_URI = 'postgresql://_0417b1ffe0f86b1b:_6746430207e5957bac157ef7bd0c34@primary.postgresql--zmqg5m9l82lf.addon.code.run:29611/_df7df579d150?sslmode=require'

def conectar():
    engine = create_engine(DATABASE_URI)
    Session = sessionmaker(bind=engine)
    s = Session()

    if s != None:
        print ("Conexión a base de datos OK")
    else:
        print("Error en la conexión a base de datos")

    return s