# Usage

Build:
```
./build.sh
```

We assume your MySQL server is running in another container called *bd*.

Run:
```
docker run -it --rm --name bd -e MYSQL_ROOT_PASSWORD=12345678 -p 3307:3306 mysql:8.0.3
```

Create tables:
```
./asana2sql.sh --access_token <yourAsanaAccessToken> --project_id <yourProjectId> --table_name subjects --odbc_string 'Driver={MySQL ODBC 8.0.11 Ansi Driver}; Server=mysql; Database=asana; UID=root; PWD=12345678; CHARSET=UTF8;' create
```

Synchronize:
```
./asana2sql.sh --access_token <yourAsanaAccessToken> --project_id <yourProjectId> --table_name subjects --odbc_string 'Driver={MySQL ODBC 8.0.11 Ansi Driver}; Server=mysql; Database=asana; UID=root; PWD=12345678; CHARSET=UTF8;' synchronyze
```
