[![Code Smells](https://sonarcloud.io/api/project_badges/measure?project=oksbwn_smarty&metric=code_smells)](https://sonarcloud.io/dashboard?id=oksbwn_smarty)  [![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=oksbwn_smarty&metric=alert_status)](https://sonarcloud.io/dashboard?id=oksbwn_smarty)

# Smarty: The Website to dig into smart home appliances!
> Setup Duplicati and Portainer credentials after the servers are up.

## Creds
Duplicati Passphrase: L2@Ki

## Docker env variables
Rename or copy the `**.env` file to `.env` and add the credentials.

## Add DB User on MongoDB(New Installation)
First access the shell of the container `docker exec -it mongo bash` and run the following commands,

```SQL
> use smarty
> db.createUser(
  {
    user: "root",
    pwd: "********", 
    roles: [
       { role: "readWrite", db: "smarty" }
    ]
  }
)
```

## Setting up NodeRED Authentication

We need to add the following code snippet to the Node-RED `settings.js` file. The passwords need to be hashed and can be generated using [this site](https://www.devglan.com/online-tools/bcrypt-hash-generator)

Edit the `settings.js` file using the command `sudo nano /opt/volumes/node-red/data/settings.js`, add the following snippet and restart the docker container, `docker restart node_red`

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
To make the http calls to the platform secured, add the following line to the `settings.js` file,

```js
    httpNodeAuth: {
        user:"app",
        pass:"xxxxxxxxxxxxxxxxxxxxxxxx"
    },
```

For serving static assets like images, without going through the platform, add the following line to the file,

```js
    httpStatic:"/assets/",
```
where you can upload all the static files to the `/assets/` folder and can be accssed by using `http(s)//<node_red_ip>:<port>/<aeet_path>` endpoint.

## Used Tools w/ Docker
1. [Node-RED [Secured with Basic Auth]](https://nodered.org/)
2. [Nginx to host the app.[Port 80 Open]](https://www.nginx.com/)
3. [Duplicati for Backups. [Secured Later with password]](https://www.duplicati.com/)
4. [mongoDB for DB. [Secured not ceonnectible from outside]](https://www.mongodb.com/)
5. [Portainer for Health details. [Secured with basic Auth]](https://www.portainer.io/)
