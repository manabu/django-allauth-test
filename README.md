Django allauth test
===================


* [djangoでソーシャルログインが簡単に実装できるdjango-allauthでTwitterログインを試してみる - Qiita](http://qiita.com/ariarijp/items/2d63e4fe69be3b64998d)


* [django-allauth/example at master · pennersr/django-allauth](https://github.com/pennersr/django-allauth/tree/master/example)


# Versions

|Software or module|Version|
| - | - |
|python|2.7.11|
|django|1.9.6|
|django-allauth|0.25.2|


# Docker build

```
docker build -t manabu/dat:0.2.0 .
```

# Run docker container

Move your development directory and

```
docker run --rm -ti -p 8000:8000 -v $PWD:/work manabu/dat:0.2.0 /bin/bash
```

# Start django project

```
cd /work
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

## Access

http://127.0.0.1:8000


# Django allauth SETUP

* [Installation — django-allauth 0.25.2 documentation](http://django-allauth.readthedocs.io/en/latest/installation.html)


# SITE_IDについて

これ確認しないとだな。
多分最初にある、example.comにSITE_ID 1 が割り振られている感じがするのだが
それとsettigns.pyを結びつけたりというのが大変そう。
２つ目作ると２になるけど、確認の方法がまだわかっていない



* [User Authentication with Django Allauth with Twitter](http://www.marinamele.com/user-authentication-with-twitter-using-django-allauth)

## sqliteなら

```
select  * from django_site;
```

で、確認

## SITE_IDの登録

```
SITE_ID = 2
```

# PROJECT_ROOT追加

BASE_DIRとかなり似ているが、定義する。
BASE_DIRでまかなえるのかは要調査

```
PROJECT_ROOT = os.path.normpath(os.path.dirname(os.path.abspath(__file__)))
```

# INSTALLED_APPS 追加

使わないappは、外しておいたほうが良い？

## ドキュメントにでていたものを追加

```
# The Django sites framework is required
'django.contrib.sites',

'allauth',
'allauth.account',
'allauth.socialaccount',
```

## 使うサービスを追加

```
'allauth.socialaccount.providers.twitter',
```

# TEMPLATESのDIRS追加

templates用の設定を追加する必要がある

```
'DIRS': [
            os.path.join(PROJECT_ROOT, "templates"),
    os.path.join(PROJECT_ROOT, "accounts/templates"),
],
```

# AUTHENTICATION_BACKENDSの追加

これが認証の方法を指定しているみたい

最後にまとめて追加

```
AUTHENTICATION_BACKENDS = (
    # Needed to login by username in Django admin, regardless of `allauth`
    'django.contrib.auth.backends.ModelBackend',

    # `allauth` specific authentication methods, such as login by e-mail
    'allauth.account.auth_backends.AuthenticationBackend',
)
```

# urls.pyの編集

こんな感じ

```
from django.conf.urls import include, url
from django.contrib import admin
from django.views.generic.base import TemplateView

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^accounts/', include('allauth.urls')),
    url(r'^$', TemplateView.as_view(template_name='index.html')),
    #url("^$", direct_to_template, {"template": "index.html"}, name="home"),
    url(r'^accounts/profile/$', TemplateView.as_view(template_name='profile.html')),

]
```

# これらを変更した後、migrate

```
python manage.py migrate
```

# web経由でのセットアップ

## サイトの追加

http://127.0.0.1:8000/admin/sites/site/

にアクセスして

- domain name
- site name

ともに

127.0.0.1:8000

で、Saveを押す

http:// は、いらない

## socialaccount の設定

http://127.0.0.1:8000/admin/socialaccount/socialapp/

ここへアクセスする

### OAuthサービス側の設定

こんどは、ローカルではなくOAuth相手の設定になる
くわしくはそっちのものをよんでもらいたいたが
なんどかはまった、callback URL は、
twitterだったら、

callback URL は以下のように設定する

http://127.0.0.1:8000/accounts/twitter/login/callback/

## 必要事項をうめる

- provider
- name
- Client id
- Secret key
- site


# templatesをつくる

```
mkdir mysite/templates
```



## エラー

```
SocialApp matching query does not exist.
```

[Django: SocialApp matching query does not exist - Stack Overflow](http://stackoverflow.com/questions/15409366/django-socialapp-matching-query-does-not-exist "Django: SocialApp matching query does not exist - Stack Overflow")


# django-rest-auth

* [Tivix/django-rest-auth: This app makes it extremely easy to build Django powered SPA's (Single Page App) or Mobile apps exposing all registration and authentication related functionality as CBV's (Class Base View) and REST (JSON)](https://github.com/Tivix/django-rest-auth)

django-rest-auth 0.7.0


# requirements.txtに追加

django-rest-auth==0.7.0

# settings.py の INSTALLED_APPS に追加

```
'rest_framework',
'rest_framework.authtoken',    
'rest_auth',
```

# url.py に追加

```
url(r'^rest-auth/', include('rest_auth.urls'))
```

# settings.py の INSTALLED_APPS に、githubを追加

```
'allauth.socialaccount.providers.github',
```

# python manage.py migrate

アプリを追加したので、migrateが必要みたい

```
You have unapplied migrations; your app may not work properly until they are applied.
Run 'python manage.py migrate' to apply them.
```

ということなので

```
python manage.py migrate
```

# github の登録

これは twitter と一緒。

twitter は OAuth 1.0 なので、2.0に対応しているものとして、github　を選んだ

## github でアプリケーションを作る

callback URL に
http://127.0.0.1:8000/rest_auth
を指定した。
これでも、ログインはできた。

## adminでSocial appを作る

## ログインのテストをする
