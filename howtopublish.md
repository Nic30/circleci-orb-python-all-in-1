### How to Publish
* create a tag in format v0.0.0 with correct next version
* After some time the github credentials expire
```
Cloning into '.'...
git@github.com: Permission denied (publickey).
fatal: Could not read from remote repository.
```
  this can be fixed by unfollow, follow of the project

* After some time the API token expires it needs to be generated a new https://app.circleci.com/settings/user/tokens
  And set in orb-publishing context https://app.circleci.com/settings/organization/github/Nic30/contexts
```
Error: Unable to publish orb: failure calling GraphQL API: 401 Unauthorized
```
  
