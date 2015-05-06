<VirtualHost *:80>
    ServerName ${:server-name}

    Alias /static ${buildout:directory}../static
    Alias /media ${buildout:directory}../media

    ProxyPass /static/ !
    ProxyPass /media/ !
    ProxyPass / http://127.0.0.1:${ports:django}/
    ProxyPassReverse / http://127.0.0.1:${ports:django}/

    ErrorLog /var/log/apache2/${:server-name}_error.log
    CustomLog /var/log/apache2/${:server-name}_access.log combined


    <Directory ${buildout:directory}../static>
        Deny from all
        Allow from all
    </Directory>

    <Directory ${buildout:directory}../media>
        Deny from all
        Allow from all
    </Directory>


</VirtualHost>

