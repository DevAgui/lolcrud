# LoLCRUD

Mi proyecto de CRUD trata de una interfaz para que los usuarios (nuevos jugadores de League of Legends) puedan introducir, borrar, modificar y consultar todos los campeones que deseen, para que se vayan familiarizando con los mismos, facilitando así que vayan reconociendo sus características más básicas como su nombre, posición, rol y su "lore".

Constará de un Login con control de acceso de usuario (registrado ya en la base de datos).
Se distinguen dos tipos de usuarios:

- ADMINISTRADOR:

Podrá consultar, eliminar, modificar y añadir usuarios.

- USUARIO SIN PERMISOS DE ADMINISTRADOR:

Podrá consultar, eliminar, modificar y añadir campeones.


## PÁGINAS


### Login




![image](https://user-images.githubusercontent.com/91873599/168672531-ee0ac787-9935-414b-984e-31e4955a7bbf.png)




Se trata de un login básico en el que tendremos que introducir nuestro usuario y contraseña. Solo en caso de que estén registradas en la base de datos podrá pasar, de lo contrario se redirigirá al usuario al login mostrándole éste mensaje:






![image](https://user-images.githubusercontent.com/91873599/168672834-957904e1-ce7c-415b-8f53-32421ed14c0f.png)





En el caso en el que tengamos un usuario malintencionado que pretenda ver el listado de campeones o del admin, existe un control que redirige al usuario de vuelta al login:




![image](https://user-images.githubusercontent.com/91873599/168673123-218bb933-9174-4b01-a241-6f7f05548af6.png)








![image](https://user-images.githubusercontent.com/91873599/168673177-83ab0c80-dfe4-43fa-819f-881bbd7ff23f.png)






### Logout

Para salir de la sesión solo tenemos que clicar en logout y nos devolverá al login.

### Listado de Campeones

Ésta es la página principal del listado de campeones, en el que al usuario le aparece solo sus campeones registrados y podrá editarlos, eliminarlos y añadir nuevos si así lo desea.




![image](https://user-images.githubusercontent.com/91873599/168673275-aa18caec-5876-4102-a430-78c94fec2a5d.png)





### Listado del Administrador

Se trata de un superusuario con todo tipo de derechos sobre los usuarios. Puede eliminarlos, modificarlos, añadir y ver todos sus datos:



![image](https://user-images.githubusercontent.com/91873599/168673599-1fcc1943-26ab-4aff-953f-c7ded7c6b38e.png)




### Enlace a vídeo de YouTube

Vídeo de YouTube explicando brevemente el CRUD: https://youtu.be/pZl9CyETNuo



¡Si te ha gustado el repo, dale estrellita! 🌟🌟🌟





