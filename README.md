redis-addons
============

Addons for Redis

I wrote an article on my personal blog ( http://francois.aichelbaum.com/infrastructure-redis-en-haute-disponibilite/ - in french ) describing how to implement Redis 2.6 in a HA way.

Since version 2.6 of Redis, a new program is provided : sentinel. It helps in failover case to promote a slave as master and warn the others slaves about the change. But it miss a few things as how will behave the old master on return. 

It also miss script to check the service from Nagios in case of using a password auth.

Here are all the files from the article.
