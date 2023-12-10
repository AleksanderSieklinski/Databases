import tkinter as tk
from tkinter import ttk as tk_ttk
import customtkinter as ctk
import psycopg2

def connect_to_database():
    try:
        connection = psycopg2.connect(
            dbname="oqphqlwh",
            user="oqphqlwh",
            password="UfuSqf7Y0_8jfVrkdXT-E8YTNWwTECtm",
            host="dumbo.db.elephantsql.com"
        )
        return connection
    except (Exception, psycopg2.Error) as error :
        print ("Error while fetching data from PostgreSQL", error)
        return None

root = ctk.CTk()
is_logged_in = False
is_admin = False
logged_name = ""
logged_surname = ""
connection = connect_to_database()

def validate_credentials(name, surname):
    # Validate login credentials against the database
    try:
        global connection
        cursor = connection.cursor()
        postgreSQL_select_Query = "select * from sklep_internetowy.Klient where imie = %s and nazwisko = %s"
        cursor.execute(postgreSQL_select_Query, (name, surname))
        user_records = cursor.fetchall()
        # If no records were found, return False
        if not user_records:
            return False
        # Otherwise, return True
        return True

    except (Exception, psycopg2.Error) as error :
        print ("Error while fetching data from PostgreSQL", error)
        return False
def login():

    def log_in():
        # Check if the user exists in the database
        if validate_credentials(name_entry.get(), surname_entry.get()):
            global is_logged_in
            global is_admin
            global logged_name
            global logged_surname
            is_logged_in = True
            logged_name = name_entry.get()
            logged_surname = surname_entry.get()
            if name_entry.get() == "admin" and surname_entry.get() == "":
                is_admin = True
                admin_access()
            else:
                orders_page()
        else:
            print("Nie ma takiego użytkownika")

    # Clear the root window
    for widget in root.winfo_children():
        widget.destroy()

    # Create login form
    name_label = ctk.CTkLabel(root, text="Imię")
    name_label.place(relx=0.5, rely=0.1, anchor=ctk.CENTER)

    name_entry = ctk.CTkEntry(root)
    name_entry.place(relx=0.5, rely=0.2, anchor=ctk.CENTER)

    surname_label = ctk.CTkLabel(root, text="Nazwisko")
    surname_label.place(relx=0.5, rely=0.3, anchor=ctk.CENTER)

    surname_entry = ctk.CTkEntry(root)
    surname_entry.place(relx=0.5, rely=0.4, anchor=ctk.CENTER)

    login_button = ctk.CTkButton(root, text="Sprawdź", command=log_in)
    login_button.place(relx=0.5, rely=0.5, anchor=ctk.CENTER)

    back_button = ctk.CTkButton(root, text="Wróć", command=main_page)
    back_button.place(relx=0.5, rely=0.6, anchor=ctk.CENTER)

def logout():
    global is_logged_in
    is_logged_in = False
    global is_admin
    is_admin = False
    global logged_name
    logged_name = ""
    global logged_surname
    logged_surname = ""
    main_page()

def register():
    # Clear the root window
    for widget in root.winfo_children():
        widget.destroy()

    def register_user():
        if not validate_credentials(name_entry.get(), surname_entry.get()):
            try:
                global connection
                # Insert the new user into the database
                query = "INSERT INTO sklep_internetowy.Klient (klientid,Imie, Nazwisko, Adres, Email, Numer_telefonu) VALUES (nextval('sklep_internetowy.klient_id_seq'), %s, %s, %s, %s, %s)"
                cur = connection.cursor()
                cur.execute(query, (name_entry.get(), surname_entry.get(), adress_entry.get(), email_entry.get(), phone_entry.get()))
                #Check if the user was added to the database
                if cur.rowcount == 0:
                    print("Nie udało się dodać użytkownika")
                else:
                    print("Użytkownik został dodany")
                # Commit the changes and close the connection
                connection.commit()
                cur.close()
                orders_page()
            except (Exception, psycopg2.DatabaseError) as error:
                print(error)
        else:
            print("Nie ma takiego użytkownika")

    # Create registration form
    name_label = ctk.CTkLabel(root, text="Imię")
    name_label.place(relx=0.25, rely=0.1, anchor=ctk.CENTER)

    name_entry = ctk.CTkEntry(root)
    name_entry.place(relx=0.25, rely=0.2, anchor=ctk.CENTER)

    surname_label = ctk.CTkLabel(root, text="Nazwisko")
    surname_label.place(relx=0.25, rely=0.3, anchor=ctk.CENTER)

    surname_entry = ctk.CTkEntry(root)
    surname_entry.place(relx=0.25, rely=0.4, anchor=ctk.CENTER)

    adress_label = ctk.CTkLabel(root, text="Adres zamieszkania")
    adress_label.place(relx=0.75, rely=0.1, anchor=ctk.CENTER)

    adress_entry = ctk.CTkEntry(root)
    adress_entry.place(relx=0.75, rely=0.2, anchor=ctk.CENTER)

    email_label = ctk.CTkLabel(root, text="Adres Email")
    email_label.place(relx=0.75, rely=0.3, anchor=ctk.CENTER)

    email_entry = ctk.CTkEntry(root)
    email_entry.place(relx=0.75, rely=0.4, anchor=ctk.CENTER)

    phone_label = ctk.CTkLabel(root, text="Numer telefonu")
    phone_label.place(relx=0.5, rely=0.5, anchor=ctk.CENTER)

    phone_entry = ctk.CTkEntry(root)
    phone_entry.place(relx=0.5, rely=0.6, anchor=ctk.CENTER)
    
    register_button = ctk.CTkButton(root, text="Zarejestruj się", command=register_user)
    register_button.place(relx=0.5, rely=0.7, anchor=ctk.CENTER)

    back_button = ctk.CTkButton(root, text="Wróć", command=main_page)
    back_button.place(relx=0.5, rely=0.8, anchor=ctk.CENTER)

def main_page():
    # Clear the root window
    for widget in root.winfo_children():
        widget.destroy()

    root.title("Sklep internetowy")

    if not is_logged_in:
        login_button = ctk.CTkButton(root, text="Zaloguj się", command=login)
        login_button.place(relx=0.5, rely=0.2, anchor=ctk.CENTER)

        register_button = ctk.CTkButton(root, text="Zarejestruj się", command=register)
        register_button.place(relx=0.5, rely=0.3, anchor=ctk.CENTER)
    else:

        new_order_page_button = ctk.CTkButton(root, text="Złóż nowe zamówienie", command=new_order_page)
        new_order_page_button.place(relx=0.5, rely=0.2, anchor=ctk.CENTER)

        orders_button = ctk.CTkButton(root, text="Sprawdź swoje zamówienia", command=orders_page)
        orders_button.place(relx=0.5, rely=0.3, anchor=ctk.CENTER)

        if not is_admin:
            logout_button = ctk.CTkButton(root, text="Wyloguj się", command=logout)
            logout_button.place(relx=0.5, rely=0.2, anchor=ctk.CENTER)
        else:
            logout_button = ctk.CTkButton(root, text="Wyloguj się", command=logout)
            logout_button.place(relx=0.5, rely=0.5, anchor=ctk.CENTER)

    if is_admin:
        admin_button = ctk.CTkButton(root, text="Admin access", command=admin_access)
        admin_button.place(relx=0.5, rely=0.4, anchor=ctk.CENTER)

        show_all_tables_button = ctk.CTkButton(root, text="Podgląd wszystkich tabeli", command=show_all_tables_page)
        show_all_tables_button.place(relx=0.5, rely=0.1, anchor=ctk.CENTER)

def admin_access():
    # Clear the root window
    for widget in root.winfo_children():
        widget.destroy()

    # Create admin access buttons

    add_department_button = ctk.CTkButton(root, text="Dodaj nowy departament", command=add_department)
    add_department_button.place(relx=0.5, rely=0.1, anchor=ctk.CENTER)

    add_employee_button = ctk.CTkButton(root, text="Dodaj pracownika", command=add_employee)
    add_employee_button.place(relx=0.5, rely=0.2, anchor=ctk.CENTER)

    add_product_button = ctk.CTkButton(root, text="Dodaj nowy produkt", command=add_product)
    add_product_button.place(relx=0.5, rely=0.3, anchor=ctk.CENTER)

    add_discount_button = ctk.CTkButton(root, text="Dodaj nową zniżkę", command=add_discount)
    add_discount_button.place(relx=0.5, rely=0.4, anchor=ctk.CENTER)

    add_delivery_button = ctk.CTkButton(root, text="Dodaj nową dostawę", command=add_delivery)
    add_delivery_button.place(relx=0.5, rely=0.5, anchor=ctk.CENTER)

    refill_product_button = ctk.CTkButton(root, text="Uzupełnij produkt", command=refill_product)
    refill_product_button.place(relx=0.5, rely=0.6, anchor=ctk.CENTER)

    back_button = ctk.CTkButton(root, text="Wróć", command=main_page)
    back_button.place(relx=0.5, rely=0.7, anchor=ctk.CENTER)

def orders_page():
    # Clear the root window
    for widget in root.winfo_children():
        widget.destroy()

    back_button = ctk.CTkButton(root, text="Wróć", command=main_page)
    back_button.place(relx=0.5, rely=0.2, anchor=ctk.CENTER)

def new_order_page():
    # Clear the root window
    for widget in root.winfo_children():
        widget.destroy()

    # Create entry fields for the product name and the amount to be ordered

    root.geometry("750x500")

    product_delivery_label = ctk.CTkLabel(root, text="Rodzaj dostawy (kurier, odbiór osobisty, paczkomat)")
    product_delivery_label.place(relx=0.25, rely=0.1, anchor=ctk.CENTER)

    product_delivery_entry = ctk.CTkEntry(root)
    product_delivery_entry.place(relx=0.25, rely=0.2, anchor=ctk.CENTER)
    
    product_method_label = ctk.CTkLabel(root, text="Rodzaj płatności")
    product_method_label.place(relx=0.25, rely=0.3, anchor=ctk.CENTER)

    product_method_entry = ctk.CTkEntry(root)
    product_method_entry.place(relx=0.25, rely=0.4, anchor=ctk.CENTER)

    product_discount_label = ctk.CTkLabel(root, text="Rodzaj zniżki (brak, stały klient, pracownik)")
    product_discount_label.place(relx=0.25, rely=0.5, anchor=ctk.CENTER)

    product_discount_entry = ctk.CTkEntry(root)
    product_discount_entry.place(relx=0.25, rely=0.6, anchor=ctk.CENTER)

    product_name_label = ctk.CTkLabel(root, text="Nazwa produktu")
    product_name_label.place(relx=0.75, rely=0.1, anchor=ctk.CENTER)

    product_name_entry = ctk.CTkEntry(root)
    product_name_entry.place(relx=0.75, rely=0.2, anchor=ctk.CENTER)

    amount_label = ctk.CTkLabel(root, text="Ilość")
    amount_label.place(relx=0.75, rely=0.3, anchor=ctk.CENTER)

    amount_entry = ctk.CTkEntry(root)
    amount_entry.place(relx=0.75, rely=0.4, anchor=ctk.CENTER)

    def add_order_to_db():
        # Connect to your database
        global connection
        cur = connection.cursor()

        # Check if the product exists in the database
        query = "SELECT 1 FROM sklep_internetowy.Produkt WHERE Nazwa = %s"
        cur.execute(query, (product_name_entry.get(),))
        if cur.fetchone() is None:
            print("The product does not exist.")
            return
        # Check if the delivery method exists in the database
        query = "SELECT 1 FROM sklep_internetowy.Dostawa WHERE DostawaID = %s"
        cur.execute(query, (product_delivery_entry.get(),))
        if cur.fetchone() is None:
            print("The delivery method does not exist.")
            return

        # Check if the payment method exists in the database
        query = "SELECT 1 FROM sklep_internetowy.Rodzaj_platnosci WHERE Rodzaj_platnosciID = %s"
        cur.execute(query, (product_method_entry.get(),))
        if cur.fetchone() is None:
            print("The payment method does not exist.")
            return

        # Check if the discount exists in the database
        query = "SELECT 1 FROM sklep_internetowy.Rabat WHERE RabatID = %s"
        cur.execute(query, (product_discount_entry.get(),))
        if cur.fetchone() is None:
            print("The discount does not exist.")
            return

        # Check if there are enough products in stock
        query = "SELECT COUNT(*) FROM sklep_internetowy.Produkt WHERE Nazwa = %s AND Dostepnosc >= %s"
        cur.execute(query, (product_name_entry.get(), amount_entry.get()))
        if cur.fetchone()[0] == 0:
            print("There are not enough products in stock.")
            return

        #Check if there are free employees in the department
        query = "SELECT COUNT(*) FROM sklep_internetowy.Pracownik WHERE DepartamentID = (SELECT DepartamentID FROM sklep_internetowy.Produkt WHERE Nazwa = %s) AND PracownikID NOT IN (SELECT PracownikID FROM sklep_internetowy.Zamowienie WHERE Data_zlozenia = CURRENT_DATE)"
        cur.execute(query, (product_name_entry.get(),))
        if cur.fetchone()[0] == 0:
            print("There are no free employees in the department.")
            return

        # Insert the new order into the database
        query = "INSERT INTO sklep_internetowy.Zamowienie (ZamowienieID, KlientID, DostawaID, Rodzaj_platnosciID, RabatID) VALUES (nextval('sklep_internetowy.zamowienie_id_seq'), (SELECT KlientID FROM sklep_internetowy.Klient WHERE Imie = %s AND Nazwisko = %s), %s, %s, %s)"
        cur.execute(query, (logged_name, logged_surname, product_delivery_entry.get(), product_method_entry.get(), product_discount_entry.get()))

        # Insert the ordered product into the database
        query = "INSERT INTO sklep_internetowy.ZamowienieProdukt (ZamowienieProduktID, ZamowienieID, ProduktID, Ilosc) VALUES (nextval('sklep_internetowy.zamowienieprodukt_id_seq'), (SELECT ZamowienieID FROM sklep_internetowy.Zamowienie WHERE KlientID = (SELECT KlientID FROM sklep_internetowy.Klient WHERE Imie = %s AND Nazwisko = %s) ORDER BY ZamowienieID DESC LIMIT 1), (SELECT ProduktID FROM sklep_internetowy.Produkt WHERE Nazwa = %s), %s)"
        cur.execute(query, (logged_name, logged_surname, product_name_entry.get(), amount_entry.get()))

        # Update the dostepnosc column for the specified product
        query = "UPDATE sklep_internetowy.Produkt SET Dostepnosc = Dostepnosc - %s WHERE Nazwa = %s"
        cur.execute(query, (amount_entry.get(), product_name_entry.get()))

        # Commit the changes and close the connection
        connection.commit()
        cur.close()

    # Create a button that adds the new order to the database when clicked
    add_button = ctk.CTkButton(root, text="Dodaj", command=add_order_to_db)
    add_button.place(relx=0.75, rely=0.6, anchor=ctk.CENTER)

    back_button = ctk.CTkButton(root, text="Wróć", command=main_page)
    back_button.place(relx=0.5, rely=0.7, anchor=ctk.CENTER)

def add_department():
    # Clear the root window
    for widget in root.winfo_children():
        widget.destroy()

    # Create entry fields for the department name and ID
    department_name_label = ctk.CTkLabel(root, text="Nazwa departamentu")
    department_name_label.place(relx=0.5, rely=0.1, anchor=ctk.CENTER)

    department_name_entry = ctk.CTkEntry(root)
    department_name_entry.place(relx=0.5, rely=0.2, anchor=ctk.CENTER)

    def add_department_to_db():
        # Connect to your database
        global connection
        cur = connection.cursor()

        # Check if the department ID already exists in the database
        query = "SELECT 1 FROM sklep_internetowy.Departament WHERE Nazwa_departamentu = %s"
        cur.execute(query, (department_name_entry.get(),))
        if cur.fetchone() is not None:
            print("The department already exists.")
            return

        # Insert the new department into the database
        query = "INSERT INTO sklep_internetowy.Departament (DepartamentID, Nazwa_departamentu) VALUES (nextval('sklep_internetowy.departament_id_seq'), %s)"
        cur.execute(query, (department_name_entry.get(),))

        # Commit the changes and close the connection
        connection.commit()
        cur.close()

    # Create a button that adds the new department to the database when clicked
    add_button = ctk.CTkButton(root, text="Dodaj", command=add_department_to_db)
    add_button.place(relx=0.5, rely=0.3, anchor=ctk.CENTER)

    back_button = ctk.CTkButton(root, text="Wróć", command=admin_access)
    back_button.place(relx=0.5, rely=0.4, anchor=ctk.CENTER)

def add_delivery():
    # Clear the root window
    for widget in root.winfo_children():
        widget.destroy()

    # Create entry fields for the delivery method name and ID
    delivery_method_label = ctk.CTkLabel(root, text="Rodzaj dostawy")
    delivery_method_label.place(relx=0.5, rely=0.1, anchor=ctk.CENTER)

    delivery_method_entry = ctk.CTkEntry(root)
    delivery_method_entry.place(relx=0.5, rely=0.2, anchor=ctk.CENTER)

    delivery_price_label = ctk.CTkLabel(root, text="Cena dostawy")
    delivery_price_label.place(relx=0.5, rely=0.3, anchor=ctk.CENTER)

    delivery_price_entry = ctk.CTkEntry(root)
    delivery_price_entry.place(relx=0.5, rely=0.4, anchor=ctk.CENTER)

    def add_delivery_to_db():
        # Connect to your database
        global connection
        cur = connection.cursor()

        # Check if the delivery method ID already exists in the database
        query = "SELECT 1 FROM sklep_internetowy.Dostawa WHERE Sposob_dostawy = %s"
        cur.execute(query, (delivery_method_entry.get(),))
        if cur.fetchone() is not None:
            print("The delivery method already exists.")
            return

        # Insert the new delivery method into the database
        query = "INSERT INTO sklep_internetowy.Dostawa (DostawaID, Sposob_dostawy, Koszt_dostawy) VALUES (nextval('sklep_internetowy.dostawa_id_seq'), %s, %s)"
        cur.execute(query, (delivery_method_entry.get(), float(delivery_price_entry.get())))

        # Commit the changes and close the connection
        connection.commit()
        cur.close()

    # Create a button that adds the new delivery method to the database when clicked
    add_button = ctk.CTkButton(root, text="Dodaj", command=add_delivery_to_db)
    add_button.place(relx=0.5, rely=0.5, anchor=ctk.CENTER)

    back_button = ctk.CTkButton(root, text="Wróć", command=admin_access)
    back_button.place(relx=0.5, rely=0.6, anchor=ctk.CENTER)

def add_employee():
    # Clear the root window
    for widget in root.winfo_children():
        widget.destroy()

    # Create entry fields for the name, surname, and department ID

    name_label = ctk.CTkLabel(root, text="Imię")
    name_label.place(relx=0.5, rely=0.1, anchor=ctk.CENTER)

    name_entry = ctk.CTkEntry(root)
    name_entry.place(relx=0.5, rely=0.2, anchor=ctk.CENTER)

    surname_label = ctk.CTkLabel(root, text="Nazwisko")
    surname_label.place(relx=0.5, rely=0.3, anchor=ctk.CENTER)

    surname_entry = ctk.CTkEntry(root)
    surname_entry.place(relx=0.5, rely=0.4, anchor=ctk.CENTER)

    department_id_label = ctk.CTkLabel(root, text="ID departamentu")
    department_id_label.place(relx=0.5, rely=0.5, anchor=ctk.CENTER)

    department_id_entry = ctk.CTkEntry(root)
    department_id_entry.place(relx=0.5, rely=0.6, anchor=ctk.CENTER)

    def add_employee_to_db():
        # Connect to your database
        global connection
        cur = connection.cursor()

        # Check if the department ID exists in the Departament table
        cur.execute("SELECT 1 FROM sklep_internetowy.Departament WHERE DepartamentID = %s", (department_id_entry.get(),))
        if cur.fetchone() is None:
            print("The department ID does not exist.")
            return

        # Insert the new employee into the database
        query = "INSERT INTO sklep_internetowy.Pracownik (PracownikID, Imie, Nazwisko, DepartamentID) VALUES (nextval('sklep_internetowy.pracownik_id_seq'), %s, %s, %s)"
        cur.execute(query, (name_entry.get(), surname_entry.get(), department_id_entry.get()))

        # Commit the changes and close the connection
        connection.commit()
        cur.close()

    # Create a button that adds the new employee to the database when clicked
    add_button = ctk.CTkButton(root, text="Dodaj", command=add_employee_to_db)
    add_button.place(relx=0.5, rely=0.7, anchor=ctk.CENTER)

    back_button = ctk.CTkButton(root, text="Wróć", command=admin_access)
    back_button.place(relx=0.5, rely=0.8, anchor=ctk.CENTER)

def add_product():
    # Clear the root window
    for widget in root.winfo_children():
        widget.destroy()

    # Create input fields for nazwa, cena, dostepnosc, opis, and produktid
    nazwa_label = ctk.CTkLabel(root, text="Nazwa")
    nazwa_label.place(relx=0.5, rely=0.08, anchor=ctk.CENTER)

    nazwa_entry = ctk.CTkEntry(root)
    nazwa_entry.place(relx=0.5, rely=0.16, anchor=ctk.CENTER)

    cena_label = ctk.CTkLabel(root, text="Cena")
    cena_label.place(relx=0.5, rely=0.24, anchor=ctk.CENTER)

    cena_entry = ctk.CTkEntry(root)
    cena_entry.place(relx=0.5, rely=0.32, anchor=ctk.CENTER)

    dostepnosc_label = ctk.CTkLabel(root, text="Dostępność")
    dostepnosc_label.place(relx=0.5, rely=0.4, anchor=ctk.CENTER)

    dostepnosc_entry = ctk.CTkEntry(root)
    dostepnosc_entry.place(relx=0.5, rely=0.48, anchor=ctk.CENTER)

    opis_label = ctk.CTkLabel(root, text="Opis")
    opis_label.place(relx=0.5, rely=0.56, anchor=ctk.CENTER)

    opis_entry = ctk.CTkEntry(root)
    opis_entry.place(relx=0.5, rely=0.64, anchor=ctk.CENTER)

    def add_product_to_db():
        # Connect to your database
        global connection
        cur = connection.cursor()

        # Insert the new product into the database
        query = "INSERT INTO sklep_internetowy.Produkt (ProduktID, Nazwa, Cena, Dostepnosc, Opis) VALUES (nextval('sklep_internetowy.produkt_id_seq'), %s, %s, %s, %s)"
        cur.execute(query, (nazwa_entry.get(), float(cena_entry.get()), int(dostepnosc_entry.get()), opis_entry.get()))

        # Commit the changes and close the connection
        connection.commit()
        cur.close()


    add_button = ctk.CTkButton(root, text="Dodaj", command=add_product_to_db)
    add_button.place(relx=0.5, rely=0.74, anchor=ctk.CENTER)

    back_button = ctk.CTkButton(root, text="Wróć", command=admin_access)
    back_button.place(relx=0.5, rely=0.84, anchor=ctk.CENTER)

def add_discount():
    # Clear the root window
    for widget in root.winfo_children():
        widget.destroy()

    # Create input fields for rodzaj_znizki and wartosc_znizki

    rodzaj_znizki_label = ctk.CTkLabel(root, text="Rodzaj zniżki")
    rodzaj_znizki_label.place(relx=0.5, rely=0.1, anchor=ctk.CENTER)

    rodzaj_znizki_entry = ctk.CTkEntry(root)
    rodzaj_znizki_entry.place(relx=0.5, rely=0.2, anchor=ctk.CENTER)

    wartosc_znizki_label = ctk.CTkLabel(root, text="Wartość zniżki")
    wartosc_znizki_label.place(relx=0.5, rely=0.3, anchor=ctk.CENTER)

    wartosc_znizki_entry = ctk.CTkEntry(root)
    wartosc_znizki_entry.place(relx=0.5, rely=0.4, anchor=ctk.CENTER)

    def add_discount_to_db():
        # Connect to your database
        global connection
        cur = connection.cursor()

        # Insert the new discount into the database
        query = "INSERT INTO sklep_internetowy.Rabat (RabatID, Rodzaj_znizki, Wartosc_znizki) VALUES (nextval('sklep_internetowy.rabat_id_seq'), %s, %s)"
        cur.execute(query, (rodzaj_znizki_entry.get(), float(wartosc_znizki_entry.get())))

        # Commit the changes and close the connection
        connection.commit()
        cur.close()

    add_discount_button = ctk.CTkButton(root, text="Dodaj", command=add_discount_to_db)
    add_discount_button.place(relx=0.5, rely=0.5, anchor=ctk.CENTER)

    back_button = ctk.CTkButton(root, text="Wróć", command=admin_access)
    back_button.place(relx=0.5, rely=0.6, anchor=ctk.CENTER)

def refill_product():
    # Clear the root window
    for widget in root.winfo_children():
        widget.destroy()

    # Create input fields for the product name and the amount to be added

    product_delivery_label = ctk.CTkLabel(root, text="Nazwa produktu")
    product_delivery_label.place(relx=0.5, rely=0.1, anchor=ctk.CENTER)

    product_name_entry = ctk.CTkEntry(root)
    product_name_entry.place(relx=0.5, rely=0.2, anchor=ctk.CENTER)

    amount_label = ctk.CTkLabel(root, text="Ilość")
    amount_label.place(relx=0.5, rely=0.3, anchor=ctk.CENTER)

    amount_entry = ctk.CTkEntry(root)
    amount_entry.place(relx=0.5, rely=0.4, anchor=ctk.CENTER)

    def refill_product_in_db():
        # Use the global connection
        global connection
        cur = connection.cursor()

        if int(amount_entry.get()) < 0:
            print("The amount must be a positive integer.")
            return

        # Check if the product exists in the database
        query = "SELECT 1 FROM sklep_internetowy.Produkt WHERE Nazwa = %s"
        cur.execute(query, (product_name_entry.get(),))
        if cur.fetchone() is None:
            print("The product does not exist.")
            return

        # Update the dostepnosc column for the specified product
        query = "UPDATE sklep_internetowy.Produkt SET Dostepnosc = Dostepnosc + %s WHERE Nazwa = %s"
        cur.execute(query, (int(amount_entry.get()), product_name_entry.get()))

        # Commit the changes and close the cursor
        connection.commit()
        cur.close()

    refill_button = ctk.CTkButton(root, text="Uzupełnij", command=refill_product_in_db)
    refill_button.place(relx=0.5, rely=0.5, anchor=ctk.CENTER)

    back_button = ctk.CTkButton(root, text="Wróć", command=admin_access)
    back_button.place(relx=0.5, rely=0.6, anchor=ctk.CENTER)

def show_all_tables_page():
    # Clear the root window
    for widget in root.winfo_children():
        widget.destroy()

    root.geometry("500x500")

    # Create a button for each table in the database
    show_departments_button = ctk.CTkButton(root, text="Departamenty", command=lambda: show_table("Departament"))
    show_departments_button.place(relx=0.5, rely=0.1, anchor=ctk.CENTER)

    show_employees_button = ctk.CTkButton(root, text="Pracownicy", command=lambda: show_table("Pracownik"))
    show_employees_button.place(relx=0.5, rely=0.2, anchor=ctk.CENTER)

    show_products_button = ctk.CTkButton(root, text="Produkty", command=lambda: show_table("Produkt"))
    show_products_button.place(relx=0.5, rely=0.3, anchor=ctk.CENTER)

    show_discounts_button = ctk.CTkButton(root, text="Zniżki", command=lambda: show_table("Rabat"))
    show_discounts_button.place(relx=0.5, rely=0.4, anchor=ctk.CENTER)

    show_orders_button = ctk.CTkButton(root, text="Zamówienia", command=lambda: show_table("Zamowienie"))
    show_orders_button.place(relx=0.5, rely=0.5, anchor=ctk.CENTER)

    show_ordered_items_button = ctk.CTkButton(root, text="Produkty w zamówieniach", command=lambda: show_table("zamowienieprodukt"))
    show_ordered_items_button.place(relx=0.5, rely=0.6, anchor=ctk.CENTER)

    show_customers_button = ctk.CTkButton(root, text="Klienci", command=lambda: show_table("Klient"))
    show_customers_button.place(relx=0.5, rely=0.7, anchor=ctk.CENTER)

    show_deliveries_button = ctk.CTkButton(root, text="Dostawy", command=lambda: show_table("Dostawa"))
    show_deliveries_button.place(relx=0.5, rely=0.8, anchor=ctk.CENTER)

    back_button = ctk.CTkButton(root, text="Wróć", command=main_page)
    back_button.place(relx=0.5, rely=0.95, anchor=ctk.CENTER)

def how_many_columns(table_name):
    connection = connect_to_database()
    cursor = connection.cursor()
    # first get names of columns
    cursor.execute("SELECT * FROM sklep_internetowy.{0} LIMIT 0".format(table_name))
    colnames = [desc[0] for desc in cursor.description]
    return len(colnames)

def show_all_records(table_name):
    connection = connect_to_database()
    cursor = connection.cursor()
    # first get names of columns
    cursor.execute("SELECT * FROM sklep_internetowy.{0} LIMIT 0".format(table_name))
    colnames = [desc[0] for desc in cursor.description]
    # then get data
    query = "SELECT * FROM sklep_internetowy.{0}".format(table_name)
    cursor.execute(query)
    records = cursor.fetchall()
    # Create a treeview with scrollbars
    tree = tk_ttk.Treeview(root, columns=colnames, show="headings")
    tree.place(relx=0.5, rely=0.5, anchor=ctk.CENTER)
    vsb = tk_ttk.Scrollbar(root, orient="vertical", command=tree.yview)
    vsb.place(relx=0.95, rely=0.5, anchor=ctk.CENTER)
    hsb = tk_ttk.Scrollbar(root, orient="horizontal", command=tree.xview)
    hsb.place(relx=0.5, rely=0.95, anchor=ctk.CENTER)
    tree.configure(yscrollcommand=vsb.set, xscrollcommand=hsb.set)
    # Insert the data into the treeview, first row is the column names and the rest are the records
    tree.insert("", "end", values=colnames)
    for record in records:
        tree.insert("", "end", values=record)

def show_table(table_name):
    for widget in root.winfo_children():
        widget.destroy()

    width = how_many_columns(table_name) * 250
    root.geometry(str(width) + "x500")
    show_all_records(table_name)

    back_button = ctk.CTkButton(root, text="Wróć", command=show_all_tables_page)
    back_button.place(relx=0.5, rely=0.95, anchor=ctk.CENTER)

def main():
   # Create the root window
    main_page()
    root.update_idletasks()
    root.geometry("500x500")

    root.mainloop()
    anext = connection.close()

if __name__ == "__main__":
    main()