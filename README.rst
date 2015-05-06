Instalazio argibideak
======================

Ohituta nago buildout_ erabiliz proiektuak martxan jartzera eta Django_ proiektuak ere horrela instalatzen ditut.

Sortu proiektuarentzako karpeta bat instalazioa egin nahi duzun makinan::

  $ cd $HOME
  $ mkdir proiektua
   
Horren barruan sortu conf, static eta media karpetak::

  $ cd proiektua
  $ mkdir -p conf static media
   
Ekarri buildout karpeta hau karpeta horretara::

  $ git clone http://github.com/erral/promesak.buildout buildout
  
Sortu virtualenv bat python 2.7 erabiliz karpeta horretan::

  $ virtualenv-2.7 buildout
  
Abiarazi buildout-a::

  $ cd buildout
  $ ./bin/python2.7 bootstrap.py
  
Konfigurazioa egokitu (domeinu izena, portua, ...) buildout.cfg fitxategia editatuz::

  $ nano buildout.cfg

Exekutatu buildout-a::

  $ ./bin/buildout -vv
  
Konfigurazioa egokitzeko sortu server_settings.py fitxategi bat conf karpeta barruan::

  $ cd $HOME/proiektua/conf
  $ nano server_settings.py
  
Informazio hau (gutxienez) bete::

    HOST = [] # produkzioan jartzeko domeinu izena

    SECRET_KEY = '' (ausazko karaktere segida)

    STATIC_ROOT = '/home/zureizena/proeiktua/static'
    MEDIA_ROOT = '/home/zureizena/proeiktua/static'

    # datu-baserako sarbide informazioa
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.mysql',
            'NAME': '',
            'USER': '',
            'PASSWORD': '',
            'HOST': '',

        }

Garapen moduan martxan jarri::

  $ ./bin/django runserver 0:8000
  
Produkzioa moduan martxan jarri, django martxan jarriz::

  $ ./bin/supervisord
  
Apache web-zerbitzaria konfiguratu aurrez sortutako konfigurazio fitxategiarekin::

  $ sudo ln -s /home/izena/proiektua/buildout/etc/apache-vh.conf /etc/apache2/sites-available/webgunea.conf
  $ sudo a2ensite webgunea.conf
  $ sudo service apache2 restart


.. _buildout: http://www.buildout.org
.. _Django: http://www.django-project.org
