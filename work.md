# Work log

## Naveen's assignment  Notes:
### Part 1:
1. Couple of bugs has been fixed including but not limited to fixing typo in mysql handler and passing `login_user` while setting root user creds for mysql. At this point ansible provisioning does not exit with any error. Moreover in commit `514ebb9` I have changed the task name, as it contained the updated password of root user. This should be avoided in genral.