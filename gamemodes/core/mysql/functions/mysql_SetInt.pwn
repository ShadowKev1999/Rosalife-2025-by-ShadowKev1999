stock mysql_SetInt(const Table[], const Field[], const To, const Where[], const Where2[])
{
    new query[128];
    mysql_format(sqlHandle, query, sizeof(query), "UPDATE `%s` SET `%s` = '%d' WHERE `%s` = '%s'", Table, Field, To, Where, Where2);
    mysql_tquery(sqlHandle, query);
    return 1;
}