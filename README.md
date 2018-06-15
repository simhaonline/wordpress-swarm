# wordpress-swarm
wordpress+Nginx swarm stack using traefik

This is a draft. Work ongoing.
Goal: having a robust wordpress stack using docker swarm and traefik.

lot of work to be done.

Steps:
- build Images using *./buildImages.sh*
- generate secrets (and modify if you want) using *./createSecretFiles.sh*
- change front rule with your website in *swarm.yml*
-deploy using *./deployStack.sh yourStackName*
