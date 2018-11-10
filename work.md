# Work log

## Part 1.

* Using pipenv to fix the ansible version to 2.5.5, you coul use ```$pipenv sync``` to ready your ansible environment from *Pipfile.lock*, then ```$pipenv shell``` to login the virtual environment.
* Fix the version of box image to 1.0.4
* Disable the synced_folder
* Adding reload nginx handler to deal with seamlessly the configure change.
* Encrypt the user's password with password_hash, we also could consider using [ansible-vault](https://docs.ansible.com/ansible/latest/user_guide/vault.html) to encrypt the credential data.
* Updating the apt-key server from *pool.sks-keyservers.net* to *pgpkeys.mit.edu* due to original server didn't reply.

## Part 2.
* Pre-requirements, docker, ansible-container
* Fix python version on 2.7 and pip version should be 9.0.3 due to leak of ansible-container dependency.
* Split original project into 3 tiers design, nginx, php and db.
* Using environment variables to init our db schema.
* Building images from ```$ansible-container build```, running container with ```$ansible-container run```.
* [Demo record](https://asciinema.org/a/PBc9cUDo0AuUexZyjDSrITHoy)

## Part 3.
1. Database volumn is missing. We need consider mount the data folder into localhost or persistent disk on GCP or AWS.
2. Database cluster archeticture. We need remove SPOF of our current db node, we need add slaves to dynamic replicate data.
3. Load blance. We could depend on Haproxy to increase our request per second capacity. Then we could use nginx to host static files.
4. CDN vendor. We could use cloudfront / incapsula / Ararmi .. etcs to deploy out content to whole world.
5. Monitor system. We need trace our application's metrics and system usage, network bandwidth. Use collectd, graphite to store them.
6. Log messages collection. Using kafka, elasticsearch to store application's log messageto check app's status.
7. Test prodes. We could depend on thousandeyes to verify the whole world agent's connection performance.
8. CI/CD server. Jenkins could hanlde testing and deploy jobs, we just need write the linking scripts.
9. DDoS protection. As our business getting bigger, we should consider our competition's attack.
10. Vault server. To keep senstive data encrypted.
11. China market. This is a new wolrd, include long wall, complicated internal ISPs, so we need another resource to handle it specifically.

## Part 4.
1. We need setup the architecture first, we could use terraform to launch nodes first, then link them into cluster.
2. Create services to monitor our containers.
3. Create volumes to keep our data.
4. Using secret to encrypt our credencital data. 