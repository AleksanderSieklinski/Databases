#include <stdio.h>
#include <stdlib.h>
#include <sql.h>
#include <sqlext.h>

void check_error(SQLRETURN ret, SQLSMALLINT type, SQLHANDLE handle) {
    if (SQL_SUCCEEDED(ret)) return;

    SQLCHAR sqlstate[1024];
    SQLCHAR message[1024];
    if (SQLGetDiagRec(type, handle, 1, sqlstate, NULL, message, sizeof(message), NULL) == SQL_SUCCESS) {
        printf("Error: %s SQLSTATE: %s\n", message, sqlstate);
    }
}

int main() {
    SQLHENV env;
    SQLHDBC dbc;
    SQLHSTMT stmt;
    SQLRETURN ret;

    // Allocate environment handle
    ret = SQLAllocHandle(SQL_HANDLE_ENV, SQL_NULL_HANDLE, &env);
    check_error(ret, SQL_HANDLE_ENV, env);

    // Set the ODBC version environment attribute
    ret = SQLSetEnvAttr(env, SQL_ATTR_ODBC_VERSION, (void *) SQL_OV_ODBC3, 0);
    check_error(ret, SQL_HANDLE_ENV, env);

    // Allocate connection handle
    ret = SQLAllocHandle(SQL_HANDLE_DBC, env, &dbc);
    check_error(ret, SQL_HANDLE_DBC, dbc);

    // Connect to the database
    ret = SQLDriverConnect(dbc, NULL, "DSN=DB1Lab;", SQL_NTS, NULL, 0, NULL, SQL_DRIVER_COMPLETE);
    check_error(ret, SQL_HANDLE_DBC, dbc);

    // Allocate statement handle
    ret = SQLAllocHandle(SQL_HANDLE_STMT, dbc, &stmt);
    check_error(ret, SQL_HANDLE_STMT, stmt);

    // Open CSV file
    FILE *file = fopen("data.csv", "r");
    if (file == NULL) {
        printf("Could not open file\n");
        return 1;
    }

    char line[256];
    while (fgets(line, sizeof(line), file)) {
        // Assuming each line is in the format "id,fname,lname,email"
        int id;
        char fname[20];
        char lname[20];
        char email[35];
        sscanf(line, "%d,%[^,],%[^,],%s", &id, fname, lname, email);

        // Insert person into database
        char query[512];
        sprintf(query, "INSERT INTO lab11.person (id, fname, lname, email) VALUES (%d, '%s', '%s', '%s')", id, fname, lname, email);

        ret = SQLExecDirect(stmt, query, SQL_NTS);
        check_error(ret, SQL_HANDLE_STMT, stmt);
    }

    fclose(file);

    // Disconnect from database
    SQLDisconnect(dbc);

    // Free handles
    SQLFreeHandle(SQL_HANDLE_STMT, stmt);
    SQLFreeHandle(SQL_HANDLE_DBC, dbc);
    SQLFreeHandle(SQL_HANDLE_ENV, env);

    return 0;
}