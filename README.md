# Los robots en todos lados

## Objetos y Clases


## Parte 1
La empresa Botnet S.A se dedica a hacer bots de Pdpwitter. Estos bots analizan todo tweet que se escribe y, en base a su contenido, deciden responderle al usuario o no. Pdpwitter, por el momento, los acepta a todos. Existen varios tipos de bots:
- Benito, el bot botón, que si un tweet contiene una palabra de su lista negra de palabras, le avisa a la policía, quien registra el usuario y el texto que se twitteó para luego investigar.
- Bots de publicidad: cada uno responde al usuario que originó el tweet con un link publicitario si el tweet contiene una palabra puntual. El mensaje y el link pueden cambiar, pero depende de cada bot. Lo que sí, obligatoriamente deben arrobar al usuario para que a él le lleguen notificaciones, así que a su respuesta se agrega una palabra que es @ concatenado con el nombre de usuario.
- Bots que juntan datos. No responden, pero se guardan información de todos los que twittean.

Un tweet se representa como una lista de strings (todas minúsculas).

**Se solicita:**

- Hacer que un bot responda a un tweet puntual.
- Hacer que una persona twittee algo. El límite en Pdpwitter es de 15 palabras. Cuando Twitter recibe un tweet, todos los bots que estén en el sistema van a responder al tweet, siempre y cuando se cumpla la condición
- Obtener el listado de tweets que aparecen en la home del usuario. Es decir, aquellos tweets que arroban al usuario en cuestión.
- Obtener el listado de tweets a la nada, que son los tweets que no arroban a nadie
- Hacer tests para los puntos anteriores..

## Parte 2
Aparecen ahora los tweets con imagen. Todo tweet puede ser sólo texto o tener además una imagen, que tiene un nombre y un tamaño en bytes. Los bots de publicidad, adaptándose a esto, pueden ahora responder con imágenes. Adaptar el código para que esto funcione.

## Parte 3
Qué pasa si ahora todo bot tiene que poder reportar a la policía? Y si son sólo Benito y los que juntan datos? Pensar en cómo hacer que no se repita código.
