create database dbescola;
use dbescola;

create table TBL_PROFESSORES (
       id int auto_increment primary key,
       nome varchar(45),
       endereço varchar(70),
       email varchar(70),
       telefone varchar(15),
       CPF varchar(14),
       idade int
       );
       
create table TBL_ALUNOS (
       id int auto_increment primary key,
       nome varchar(45),
       enderço varchar(70),
       email varchar(70),
       telefone varchar(15),
       idade int
       );
       
create table TBL_CIDADES (
       id int auto_increment primary key,
       nome varchar(45),
       UF char(2)
       );
       
create table TBL_USUARIOS (
       id int auto_increment primary key,
       nome varchar(45),
       username varchar(45),
       senha varchar(45)
       );
       
create table TBL_CURSOS (
       id int auto_increment primary key,
       nome varchar(45),
       valor decimal(10,2)
       );
       
import mysql.connector
from mysql.connector import Error

try:
    connection = mysql.connector.connect(
        host='localhost',
        database='nome_do_banco',
        user='seu_usuario',
        password='sua_senha'
    )

    if connection.is_connected():
        print("Conectado ao banco de dados")

        cursor = connection.cursor()
        cursor.execute("SELECT * FROM sua_tabela")
        
        resultados = cursor.fetchall()
        for row in resultados:
            print(row)

except Error as e:
    print(f"Erro ao conectar ao MySQL: {e}")

finally:
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("Conexão ao MySQL fechada")
        
    


def validar_login():
    usuario = entry_usuario.get()
    senha = entry_senha.get()

    try:
        connection = mysql.connector.connect(
            host='localhost',
            database='nome_do_banco',
            user='seu_usuario',
            password='sua_senha'
        )

        cursor = connection.cursor()
        cursor.execute("SELECT * FROM usuarios WHERE usuario = %s AND senha = %s", (usuario, senha))
        resultado = cursor.fetchone()

        if resultado:
            messagebox.showinfo("Login", "Login bem-sucedido!")
            # Aqui você pode abrir a próxima janela
        else:
            messagebox.showerror("Login", "Usuário ou senha incorretos.")

    except Error as e:
        messagebox.showerror("Erro", f"Erro ao conectar ao banco de dados: {e}")
    
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()







import tkinter as tk
from tkinter import messagebox

# Função para validar o login
def validar_login():
    usuario = entry_usuario.get()
    senha = entry_senha.get()
    
    # Aqui você pode substituir pela lógica de verificação com o banco de dados
    if usuario == "admin" and senha == "senha123":  # Exemplo simples
        messagebox.showinfo("Login", "Login bem-sucedido!")
        # Aqui você pode chamar a função para abrir a próxima janela
    else:
        messagebox.showerror("Login", "Usuário ou senha incorretos.")

# Criando a janela principal
janela = tk.Tk()
janela.title("Tela de Login")

# Configurando a interface
tk.Label(janela, text="Usuário").pack(pady=10)
entry_usuario = tk.Entry(janela)
entry_usuario.pack(pady=5)

tk.Label(janela, text="Senha").pack(pady=10)
entry_senha = tk.Entry(janela, show='*')
entry_senha.pack(pady=5)

# Botão de Login
btn_login = tk.Button(janela, text="Login", command=validar_login)
btn_login.pack(pady=20)

# Iniciando o loop da interface
janela.mainloop()