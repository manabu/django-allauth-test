Django allauth test
===================


* [djangoでソーシャルログインが簡単に実装できるdjango-allauthでTwitterログインを試してみる - Qiita](http://qiita.com/ariarijp/items/2d63e4fe69be3b64998d)


* [django-allauth/example at master · pennersr/django-allauth](https://github.com/pennersr/django-allauth/tree/master/example)


#

```
docker build sample/dat:0.1.0
```

# Start django project

```
django-admin startproject mysite .
```

* [Your first Django project! · Django Girls Tutorial](http://tutorial.djangogirls.org/en/django_start_project/)

# Init project

```
python manage.py migrate
```

```
python manage.py createsuperuser
```

It's not accept weak password.

Don't forget your admin password.


# Run your server

```
python manage.py runserver 0.0.0.0:8000
```


# Django allauth SETUP

* [Installation — django-allauth 0.25.2 documentation](http://django-allauth.readthedocs.io/en/latest/installation.html)


# SITE_IDについて

これ確認しないとだな。
多分最初にある、example.comにSITE_ID 1 が割り振られている感じがするのだが
それとsettigns.pyを結びつけたりというのが大変そう。
２つ目作ると２になるけど、確認の方法がまだわかっていない

* [User Authentication with Django Allauth with Twitter](http://www.marinamele.com/user-authentication-with-twitter-using-django-allauth)

# PROJECT_ROOT追加

PROJECT_ROOT = os.path.normpath(os.path.dirname(os.path.abspath(__file__)))

# INSTALLED_APPS 追加

使わないappは、外しておいたほうが良い？

# TEMPLATESのDIRS追加

templates用の設定を追加する必要がある

# AUTHENTICATION_BACKENDSの追加

これが認証の方法を指定しているみたい
