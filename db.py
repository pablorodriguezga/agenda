from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker


DATABASE_URI = 'postgresql://postgres:amigotes21@localhost:5432/agenda'

def conectar():
    engine = create_engine(DATABASE_URI)
    Session = sessionmaker(bind=engine)
    s = Session()

    if s != None:
        print ("Conexión a base de datos OK")
    else:
        print("Error en la conexión a base de datos")

    return s