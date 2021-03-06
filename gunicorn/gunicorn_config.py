pidfile = 'app01.pid'
worker_class = 'gthread'
workers = 5
worker_connections = 1000
timeout = 30
keepalive = 2
threads = 2
proc_name = 'app01'
bind = '127.0.0.1:5000'
backlog = 2048
accesslog = 'access.log'
errorlog = 'error.log'
user = 'vagrant'
group = 'vagrant'
