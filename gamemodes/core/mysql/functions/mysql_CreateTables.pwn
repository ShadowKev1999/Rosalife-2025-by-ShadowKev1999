stock mysql_CreateTables() {

    mysql_tquery_file(sqlHandle, "mysql/"#MYSQL_TABLE_DATA"", "onCreateTablesExecuted");
    return 1;
}

forward onCreateTablesExecuted();
public onCreateTablesExecuted() {
    printf("onCreateTablesExecuted() executed. Tables creating!");
    return 1;
}