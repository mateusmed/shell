
install:
```
sudo apt-get install jq
```

official site:
```
https://stedolan.github.io/jq/tutorial/
```

The beautiful manual of this incredible tool

```
https://stedolan.github.io/jq/manual/
```

Manipulate from url:
```
curl 'https://api.github.com/repos/stedolan/jq/commits?per_page=5' | jq '.'
```

Get the first, the simple of first <.[0]> example:
```
curl 'https://api.github.com/repos/stedolan/jq/commits?per_page=5' | jq '.[0]'
```

Build object with information what do you want
```
curl 'https://api.github.com/repos/stedolan/jq/commits?per_page=5' | jq '.[0] | {message: .commit.message, name: .commit.committer.name}'
```

Get from root path <.commit> and inside the commit get <commiter> final command:
```
curl 'https://api.github.com/repos/stedolan/jq/commits?per_page=5' | jq '.[0] | {commiter   : .commit.committer}'
```

Response:
```
{
  "commiter": {
    "name": "William Langford",
    "email": "wlangfor@gmail.com",
    "date": "2020-06-08T16:35:13Z"
  }
}
```

Show all of the new object:
```
curl 'https://api.github.com/repos/stedolan/jq/commits?per_page=5' | jq '.[] | {message: .commit.message, name: .commit.committer.name}'
```

Get all in list:
```
curl 'https://api.github.com/repos/stedolan/jq/commits?per_page=5' | jq '[.[] | {message: .commit.message, name: .commit.committer.name}]'
```

Get all in list and save file:
```
curl 'https://api.github.com/repos/stedolan/jq/commits?per_page=5' | jq '[.[] | {message: .commit.message, name: .commit.committer.name}]' >> file.json
```


