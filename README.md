# Smarty: The Website to dig into smart home appliances!
> Setup Duplicati and Portainer credntials after the servers are up.

## Creds
Duplicati Passphrase: L2@Ki

## Settign up NodeRED Authentication

We need to add the following code snipper to the nodered `settings.js` file. The passwords need to be hashed and can be generated using [this site](https://www.devglan.com/online-tools/bcrypt-hash-generator)

Edit the `settings.js` file using the command `sudo nano /opt/volumes/node-red/data/settings.js`, add the following snippet and retstart the docker container, `docker restart node_red`

```js
    adminAuth: {
        type: "credentials",
        users: [
            {
                username: "admin",
                password: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                permissions: "*"
            },
            {
                username: "app",
                password: "xxxxxxxxxxxxxxxxxxx",
                permissions: "read"
            }
        ]
    }
```
## Used Tools w/ Docker
1. Node-RED
2. Nginx to host the app.
3. Duplicati for Backups.
4. mongoDB for DB.
5. Portainer for Health details.