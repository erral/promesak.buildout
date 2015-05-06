<VirtualHost *:80>
    ServerName ${:server-name}

    ProxyPass http://127.0.0.1:${ports:django}

    Alias /static ${buildout:directory}../static
    Alias /media ${buildout:directory}../media

    <Directory ${buildout:directory}../static>
        Deny from all
        Allow from all
    </Directory>

    <Directory ${buildout:directory}../media>
        Deny from all
        Allow from all
    </Directory>


</VirtualHost>

