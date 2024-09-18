import tkinter as tk
from tkinter import messagebox


def validar_login():
    usuario = entry_usuario.get()
    senha = entry_senha.get()

    if usuario == "admin" and senha == "admin":
        messagebox.showinfo("Login", "Login bem-sucedido!")
    else:
        messagebox.showerror("Login", "Usuário ou senha incorretos.")


janela = tk.Tk()
janela.title("Tela de Login")

tk.Label(janela, text="Usuário").pack(pady=10)
entry_usuario = tk.Entry(janela)
entry_usuario.pack(pady=5)

tk.Label(janela, text="Senha").pack(pady=10)
entry_senha = tk.Entry(janela, show='*')
entry_senha.pack(pady=5)

btn_login = tk.Button(janela, text="Login", command=validar_login)
btn_login.pack(pady=20)

janela.mainloop()