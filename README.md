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
