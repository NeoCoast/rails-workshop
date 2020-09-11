# API de Posts

### Instalación

- Clonar el repo e ir a la carpeta del proyecto.
- Configurar el archivo `config/database.yml` con la configuración de PostgreSQL local.
- `rails db:create db:migrate db:seed` o `rails db:reset` si ya existen las bases de datos
- `rails server` para inicializar el servidor en `localhost:3000`
---
### Endpoints disponibles

#### POST /api/v1/users

Crea un usuario.

##### Payload de petición:
- `email`
- `username`

##### Respuesta:
Status 200

JSON:
- `id`
- `email`
- `username`

#### GET /api/v1/users

Lista todos los usuarios del sistema.

##### Respuesta:
Status 200

JSON:
- Arreglo:
    - `id`
    - `email`
    - `username`

#### GET /api/v1/users/:user_id

Muestra los datos del usuario con id :user_id.

##### Respuesta:
Status 200

JSON:
- `id`
- `email`
- `username`

#### PUT /api/v1/users/:user_id/follow

Hace al usuario de id :user_id seguir al usuario con id `followee_id`.

##### Payload de request:
- `followee_id`

##### Respuesta: 
Status 200

#### GET /api/v1/users/:user_id/followers

Lista los seguidores del usuario con id :user_id.

##### Respuesta
Status 200

JSON:
- Arreglo:
    - `id`
    - `email`
    - `username`

#### GET /api/v1/users/:user_id/followees

Lista los usuarios seguidos por el usuario con id :user_id.

##### Respuesta
Status 200

JSON:
- Arreglo:
    - `id`
    - `email`
    - `username`

#### POST /api/v1/users/:user_id/posts

Crea un post para el usuario de id :user_id.

##### Payload de request:
- `title`
- `content`

##### Respuesta:
Status 200

JSON:
- `id`
- `title`
- `content`
- `username`
- `username_id`
- `date_created`
- `comments` (arreglo vacío)

#### GET /api/v1/users/:user_id/posts

Lista los posts creados por el usuario :user_id.

##### Respuesta
Status 200

JSON:
- Arreglo:
    - `id`
    - `title`
    - `content`
    - `username`
    - `username_id`
    - `date_created`
    - `comments` arreglo:
        - `content`
        - `date_created`

#### GET /api/v1/posts/:post_id

Muestra los datos del post con id :post_id.

##### Respuesta
Status 200

JSON:
- `id`
- `title`
- `content`
- `username`
- `username_id`
- `date_created`
- `comments` arreglo:
    - `content`
    - `date_created`

#### DELETE /api/v1/posts/:post_id

Borra el post con id :post_id y sus comentarios.

##### Respuesta:
Status 200

#### POST /api/v1/posts/:post_id/comments

Crea un comentario en el post de id :post_id

##### Payload de petición:

- `content`

##### Respuesta:
Status 200

JSON:
- `content`
- `date_created`