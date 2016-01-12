# Ideas

## How to

 * Launch the VM and provision it: `vagrant up ideas`
 * SSH into the VM: `vagrant ssh ideas`
 * Load the virtualenv: `source env/bin/activate`
 * Initialize the db: `python manage.py migrate`
 * Launch the app: `python manage.py runserver 0.0.0.0:8000`
 * Create a super user: `python manage.py createsuperuser`
 * Access the DB: sudo su postgres && psql && \c ideas && \d && \q

## Oauth login

This application supports Facebook and Google login, you need to export the keys and secrets:

```
export IDEAS_FACEBOOK_KEY='facebook-key'
export IDEAS_FACEBOOK_SECRET='facebook-secret'
export IDEAS_GOOGLE_KEY='google-key'
export IDEAS_GOOGLE_SECRET='google-secret'
```

## Webapp access

The port 8000 is forwarded to the host, you HAVE to access the website using this URL: `http://localhost:8000/ideas` otherwise the login won't work.

The admin panel can be found here: `http://localhost:8080/admin`.

## EC2 deployment

## Provisioning the machine

 * `ssh -i aws-key.pem user@domain.com`
 * `export AWS_ACCESS_KEY="..."`
 * `export AWS_SECRET_KEY="..."`
 * `ansible-playbook -i inventory --sudo playbook-ec2.yml --ask-sudo-pass`

## Jenkins job

This is not a best practice, as we should use parameterized jobs to deploy on different environments,
but I am using a deployment/ folder at the root of the project, which contains 'live' configurations.
Here is the jenkins job to deploy the application:

```
#!/bin/bash
cd /opt/ideas
virtualenv env --no-site-package
source env/bin/activate
pip install -r requirements.txt
pip install gunicorn
cp deployment/settings.py ideas/ideas/settings.py
cp deployment/gunicorn_config.py env
cd ideas
python manage.py migrate
sudo service nginx restart
sudo supervisorctl restart ideas
```

## Unit tests

Run the following command: `python manage.py test`

## TODO

### INFRA

 * Enable production mode in deployment/settings.py (http://stackoverflow.com/questions/5836674/why-does-debug-false-setting-make-my-django-static-files-access-fail)

### FEATURES

 * Functionnal tests (https://docs.djangoproject.com/en/1.8/intro/tutorial05/)
 * Fix the admin pages CSS (CSS goes 404 in the admin panel in production mode)
 * Add a cancel button (go back to previous page) on the form page
 * Add a Delete Idea feature in the action bar of the details page
 * Add the tag feature (postgres text array + api + autocomplete field on create page)
 * Use purecss, jquery and quill libs locally (so that later we can minify them)
