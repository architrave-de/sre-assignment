# Work log

## Part 1.

* Using pipenv to fix the ansible version to 2.5.5, you coul use ```$pipenv sync``` to ready your ansible environment from *Pipfile.lock*, then ```$pipenv shell``` to login the virtual environment.
* Fix the version of box image to 1.0.4
* Disable the synced_folder
* Adding reload nginx handler to deal with seamlessly the configure change.
* Encrypt the user's password with password_hash, we also could consider using [ansible-vault](https://docs.ansible.com/ansible/latest/user_guide/vault.html) to encrypt the credential data.
* Updating the apt-key server from *pool.sks-keyservers.net* to *pgpkeys.mit.edu* due to original server didn't reply.

## Part 2.

## Part 3.

## Part 4.