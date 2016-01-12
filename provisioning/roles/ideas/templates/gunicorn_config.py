command = '{{ virtual_env_path }}/bin/gunicorn'
pythonpath = '{{ base }}/ideas'
bind = '127.0.0.1:8000'
workers = 3
user = 1000
