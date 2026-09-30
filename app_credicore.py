import streamlit as st
import pandas as pd
import pyodbc

# 1. Configuración de Conexión (Datos exactos de tu entorno)
SERVER = 'localhost' # o '127.0.0.1' si localhost da problema
DATABASE = 'CrediCoreDB'
USERNAME = 'CrediAdmin'
PASSWORD = 'Password_Fuerte2026!'

# Cadena de conexión usando el driver estándar de SQL Server
conn_str = f'DRIVER={{SQL Server}};SERVER={SERVER};DATABASE={DATABASE};UID={USERNAME};PWD={PASSWORD};TrustServerCertificate=yes;'
st.set_page_config(page_title="ERP CrediCore", layout="centered")
st.title("CrediCore - Módulo de Caja")
st.markdown("Interfaz conectada directamente al motor transaccional de SQL Server")

# 2. Leer la Vista Segura
st.subheader("Estado de Cuenta (Vista Segura)")
try:
    conn = pyodbc.connect(conn_str)
    # Llamamos a tu vista con el esquema Operaciones
    query = "SELECT * FROM Operaciones.vw_AtencionAlCliente"
    df = pd.read_sql(query, conn)
    st.dataframe(df, use_container_width=True)
except Exception as e:
    st.error(f"Error de conexión a la BD: {e}")

st.divider()

# 3. Formulario para ejecutar el Procedimiento Almacenado
st.subheader("Procesar Pago de Cuota")
with st.form("form_pago", clear_on_submit=True):
    id_credito = st.number_input("Número de Crédito (ID)", min_value=1, step=1)
    monto_pago = st.number_input("Monto a Abonar (Q)", min_value=1.0, step=100.0)
    btn_pagar = st.form_submit_button("Ejecutar Transacción")
    
    if btn_pagar:
        try:
            cursor = conn.cursor()
            # Invocamos tu SP con el esquema Operaciones
            cursor.execute(f"EXEC Operaciones.SP_ProcesarPago @IdCredito = {id_credito}, @MontoAbono = {monto_pago}")
            cursor.commit()
            st.success("¡Pago procesado con éxito en SQL Server!")
            st.rerun() # Recarga la pantalla
        except Exception as e:
            # Aquí capturamos el THROW/RAISERROR de tu base de datos
            st.error(f"Transacción Rechazada por el Motor: {e}")