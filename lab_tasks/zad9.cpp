// zad9.cpp

#include <iostream>
#include <stdio.h>
#include <libpq-fe.h>

PGconn* connectToDatabase() {
    const char *conninfo = "dbname=u1sieklinski user=u1sieklinski password=1sieklinski";
    PGconn *conn = PQconnectdb(conninfo);

    if (PQstatus(conn) != CONNECTION_OK) {
        printf("Connection to database failed: %s", PQerrorMessage(conn));
        PQfinish(conn);
        return NULL;
    }

    printf("Connected to database successfully.\n");
    return conn;
}

void closeConnection(PGconn *conn) {
    PQfinish(conn);
    printf("Connection to database closed.\n");
}

void executeQuery(PGconn *conn, const char *query) {
    PGresult *res = PQexec(conn, query);

    if (PQresultStatus(res) != PGRES_COMMAND_OK) {
        printf("Query execution failed: %s", PQerrorMessage(conn));
        PQclear(res);
        return;
    }

    PQclear(res);
}

void WprowadzDane(PGconn *conn, const char *table, const char *values) {
    char query[256];
    sprintf(query, "INSERT INTO %s VALUES (%s);", table, values);
    std::cout<<query<<std::endl;
    executeQuery(conn, query);
}

void UsunDane(PGconn *conn, const char *table, const char *condition) {
    char query[256];
    sprintf(query, "DELETE FROM %s WHERE %s;", table, condition);
    std::cout<<query<<std::endl;
    executeQuery(conn, query);
}

void AktualizujDane(PGconn *conn, const char *table, const char *values, const char *condition) {
    char query[256];
    sprintf(query, "UPDATE %s SET %s WHERE %s;", table, values, condition);
    std::cout<<query<<std::endl;
    executeQuery(conn, query);
}

void WczytajDane(PGconn *conn, const char *table) {
    char query[256];
    sprintf(query, "SELECT * FROM %s;", table);
    std::cout<<query<<std::endl;
    PGresult *res = PQexec(conn, query);

    if (PQresultStatus(res) != PGRES_TUPLES_OK) {
        printf("Query zakończyło się niepowodzeniem: %s", PQerrorMessage(conn));
        PQclear(res);
        return;
    }

    int rows = PQntuples(res);

    for(int i=0; i<rows; i++) {
        for(int j=0; j<PQnfields(res); j++) {
            printf("%s\t", PQgetvalue(res, i, j));
        }
        printf("\n");
    }

    PQclear(res);
}

int main() {
    PGconn *conn = connectToDatabase();
    if (conn == NULL){
        return 1;
    }
    // Wprowadz rzad do tabeli arg2 gdzie arg3 to jego wartosci
    WprowadzDane(conn, "lab00.student", "1, 'Doe', 'John', '1234567890'");
    // Zaktualizuj w tabeli arg2 wartosc arg3 gdzie arg4
    AktualizujDane(conn, "lab00.student", "telefon='0987654321'", "id_stud=1");
    // Wyswietl cala tabele arg2
    WczytajDane(conn, "lab00.student");
    // Usuń rzad z tabeli arg2 gdzie arg3
    UsunDane(conn, "lab00.student", "id_stud=1");
    closeConnection(conn);
    return 0;
}