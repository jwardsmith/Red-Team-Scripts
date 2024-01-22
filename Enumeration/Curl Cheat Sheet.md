# Curl Cheat Sheet

- GET request with curl

```
curl http://website.com
```

- Verbose GET request with curl

```
curl http://website.com -v
```

- Basic Auth login with curl

```
curl http://admin:password@website.com/ -vvv
```

- Alternate curl Basic Auth login

```
curl -u admin:password  http://website.com/ -vvv
```

- Basic Auth login, follow redirection with curl

```
curl -u admin:password -L http://website.com/
```

- GET request with parameter with curl

```
curl -u admin:password 'http://website.com/search.php?port_code=us'
```

- POST request with curl

```
curl -d 'username=admin&password=password' -L http://website.com/login.php
```

- Debugging with curl

```
curl -d 'username=admin&password=password' -L  http://website.com/login.php -v
```

- Cookie usage with curl

```
curl -d 'username=admin&password=password' -L --cookie-jar /dev/null  http://website.com/login.php -v
```

- Cookie file with curl

```
curl -d 'username=admin&password=password' -L --cookie-jar cookies.txt  http://website.com/login.php
```

- Specify content type with curl

```
curl -H 'Content-Type: application/json' -d '{ "username" : "admin", "password" : "password" }'
```

- OPTIONS request with curl

```
curl -X OPTIONS http://website.com/ -vv
```

- File upload with curl

```
curl -X PUT -d @test.txt http://website.com/test.txt -vv
```

- DELETE method with curl

```
curl -X DELETE http://website.com/test.txt -vv
```
