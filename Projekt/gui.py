import tkinter as tk
import psycopg2

def login():
    # Clear the root window
    for widget in root.winfo_children():
        widget.destroy()

    # Create login form
    username_label = tk.Label(root, text="Username")
    username_label.pack()

    username_entry = tk.Entry(root)
    username_entry.pack()

    password_label = tk.Label(root, text="Password")
    password_label.pack()

    password_entry = tk.Entry(root, show="*")
    password_entry.pack()

    login_button = tk.Button(root, text="Log in", command=lambda: validate_credentials(username_entry.get(), password_entry.get()))
    login_button.pack()

    back_button = tk.Button(root, text="Go back", command=main_page)
    back_button.pack()

def validate_credentials(username, password):
    # Validate login credentials against the database
    try:
        connection = psycopg2.connect(
            dbname="oqphqlwh",
            user="oqphqlwh",
            password="UfuSqf7Y0_8jfVrkdXT-E8YTNWwTECtm",
            host="dumbo.db.elephantsql.com"
        )
        cursor = connection.cursor()
        postgreSQL_select_Query = "select * from users where username = %s and password = %s"
        cursor.execute(postgreSQL_select_Query, (username, password))
        user_records = cursor.fetchall()

        # If no records were found, return False
        if not user_records:
            return False

        # Otherwise, return True
        return True

    except (Exception, psycopg2.Error) as error :
        print ("Error while fetching data from PostgreSQL", error)

    finally:
        if(connection):
            cursor.close()
            connection.close()
            print("PostgreSQL connection is closed")

def validate_username(username):
    # Check if the username is already taken
    try:
        connection = psycopg2.connect(
            dbname="oqphqlwh",
            user="oqphqlwh",
            password="UfuSqf7Y0_8jfVrkdXT-E8YTNWwTECtm",
            host="dumbo.db.elephantsql.com"
        )
        cursor = connection.cursor()
        postgreSQL_select_Query = "Create
        postgreSQL_select_Query = "select * from users where username = %s"
        cursor.execute(postgreSQL_select_Query, (username,))
        user_records = cursor.fetchall()

        # If any records were found, return False
        if user_records:
            return False

        # Otherwise, return True
        return True

    except (Exception, psycopg2.Error) as error :
        print ("Error while fetching data from PostgreSQL", error)

    finally:
        if(connection):
            cursor.close()
            connection.close()
            print("PostgreSQL connection is closed")

def main_page():
    # Clear the root window
    for widget in root.winfo_children():
        widget.destroy()

    login_button = tk.Button(root, text="Log in", command=login)
    login_button.pack()

    register_button = tk.Button(root, text="Register new user", command=register)
    register_button.pack()

    admin_button = tk.Button(root, text="Admin access", command=admin_access)
    admin_button.pack()

def register():
    # Clear the root window
    for widget in root.winfo_children():
        widget.destroy()

    # Create registration form
    username_label = tk.Label(root, text="Username")
    username_label.pack()

    username_entry = tk.Entry(root)
    username_entry.pack()

    password_label = tk.Label(root, text="Password")
    password_label.pack()

    password_entry = tk.Entry(root, show="*")
    password_entry.pack()

    # Add more fields as needed...

    register_button = tk.Button(root, text="Register", command=lambda: validate_username(username_entry.get()))
    register_button.pack()

    back_button = tk.Button(root, text="Go back", command=main_page)
    back_button.pack()

def admin_access():
    # Clear the root window
    for widget in root.winfo_children():
        widget.destroy()

    # Create admin access buttons
    add_employee_button = tk.Button(root, text="Add employee")#, command=add_employee)
    add_employee_button.pack()

    add_product_button = tk.Button(root, text="Add product")#, command=add_product)
    add_product_button.pack()

    add_discount_button = tk.Button(root, text="Add discount")#, command=add_discount)
    add_discount_button.pack()

    refill_product_button = tk.Button(root, text="Refill product")#, command=refill_product)
    refill_product_button.pack()

    back_button = tk.Button(root, text="Go back", command=main_page)
    back_button.pack()

# Replace the initial button creation with a call to main_page
root = tk.Tk()
root.geometry("600x400")

main_page()

root.mainloop()