![image docker](./Github-sources/docker-symfony.png)
# Symfony on Docker
> This repository is designed for developers who want to set up a symfony 5 (with webpack encore), php 8 environment under docker very quickly

# Dependencies
You have to install these dependencies before to run this script
- [Docker](https://docs.docker.com/get-docker/) 🐳
- [Composer](https://getcomposer.org/download/)
- [Symfony](https://symfony.com/download)

# images docker and usage

<img src="/Users/Vince/PhpstormProjects/symfony-docker/Github-sources/docker-images.png" width="400"/>

_This image is an example_

|    image                                   | usage                                                                            |
|--------------------------------------------|----------------------------------------------------------------------------------|
|    nginx                                   |     Web server                                                                   |
|   php:8.0-fpm                              |   PHP server and proxy                                                           |
|   adminer                                  |   Database management tool written in PHP                                        |
|   maildev/maildev                          |   Mail test web interface                                                        |
|   mariadb                                  |  Database server                                                                |
|   thecodingmachine/php:8.0-v4-cli-node14   |  PHP server and node cli. This server is used for the update of dependencies.    |
|   node:14-alpine                           | Server node for webpack                                                          |

# ⚡️ Usage

1. Add your environment variables to the dotenv file 
`.env`,` .env.local`, `.env.dev`,` .env.dev.local`
   
2. Change the variable `PROJECT_NAME` in `.env` file by your project name

3. Change the variable `DB_NAME` in `.env` file by your db name

4. Optional, you can change all port with these variables

    | Image   | Variable     | Default port |
    |---------|--------------|--------------|
    | mariadb | MARIADB_PORT | 3306         |
    | adminer | ADMINER_PORT | 8080         |
    | nginx   | NGINX_PORT   | 80           |
    | maildev | MAILDEV_PORT | 8081         |

5. Run the script `sh install.sh` and enjoy 🎉!

<img alt="Install symfony on docker" src="/Users/Vince/PhpstormProjects/symfony-docker/Github-sources/command-line.gif" title="sh install.sh" width="500"/>

![enjoy](./Github-sources/enjoy.gif)

# ⭐️ Project assistance
  
  If you want to say thank you or/and support active development of this script:
  
  You can add a [GitHub Star](https://github.com/vincentBesseau/symfony-docker/stargazers) Star to the project.

# Credits
This script was created with phpstorm with open source licence.
Thank you [jetBrains](https://www.jetbrains.com/?from=Gladys)
![jetbrains](./Github-sources/jetbrain.png)

# licence

MIT License
