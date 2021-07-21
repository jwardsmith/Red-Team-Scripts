# Curl 
curl http://website.com = GET request with curl
curl http://website.com -v = Verbose GET request with curl
curl http://admin:password@website.com/ -vvv = curl Basic Auth login
curl -u admin:password  http://website.com/ -vvv = Alternate curl Basic Auth login
curl -u admin:password -L http://website.com/ = curl Basic Auth login, follow redirection
curl -u admin:password 'http://website.com/search.php?port_code=us' = curl GET request with parameter
curl -d 'username=admin&password=password' -L http://website.com/login.php = POST request with curl
curl -d 'username=admin&password=password' -L  http://website.com/login.php -v = Debugging with curl
curl -d 'username=admin&password=password' -L --cookie-jar /dev/null  http://website.com/login.php -v = Cookie usage with curl
curl -d 'username=admin&password=password' -L --cookie-jar cookies.txt  http://website.com/login.php = curl with cookie file
curl -H 'Content-Type: application/json' -d '{ "username" : "admin", "password" : "password" }' = curl specify content type
curl -X OPTIONS http://website.com/ -vv = curl OPTIONS request
curl -X PUT -d @test.txt http://website.com/test.txt -vv = File upload with curl
curl -X DELETE http://website.com/test.txt -vv = DELETE method with curl
