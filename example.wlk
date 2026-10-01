// Policia
object policia {
  const denuncias = []
  
  method recibirDenuncia(usuario, tweet) {
    denuncias.add([usuario, tweet])
  }
  
  method denuncias() = denuncias
} 

// Benito
object benito {
  const listaNegra = ["robo", "estafa", "armas"]
  
  method quiereResponder(tweet) = tweet.any(
    { palabra => listaNegra.contains(palabra) }
  )
  
  method responder(tweet, usuario) {
    if (self.quiereResponder(tweet)) policia.recibirDenuncia(usuario, tweet)
  }
} 

// Bot publicidad
class BotPublicidad {
  const palabraPuntual
  const mensaje
  const link
  const imagen = ""

  method imagen() = imagen
  // Devuelve  condición (verdadero) si la palabra puntual está dentro de la lista de palabras del tweet
  method quiereResponder(tweet) = tweet.any(
    { palabra => palabra == palabraPuntual }
  )
  
  // Respuesta con el mensaje, link , @ y usuario
  method responder(tweet, usuario) {
    if (self.quiereResponder(tweet)) {
      return mensaje + " " + link + " @" + usuario
    } else {
      return ""
    }
  }
} 

// Bot recolector de datos
class BotRecolector {
  const usuariosQueTwittearon = []
  
  method responder(tweet, usuario) {
    usuariosQueTwittearon.add(usuario)
  }
  
  method usuariosQueTwittearon() = usuariosQueTwittearon
}

object pdtwitter {
  const bots = []
  const tweets = []
  
  method bots() = bots
  
  method tweets() = tweets
  
  //Registra los bots en la lista "bots"
  method agregarBot(bot) {
    bots.add(bot)
  }
  
  method twittear(usuario, tweet) {
    if (tweet.size() <= 15) {
      tweets.add(tweet)
      bots.forEach({ bot => bot.responder(tweet, usuario) })
    }
  }

  // Obtener el listado de tweets que aparecen en la home del usuario.
  method home(usuario) = tweets.filter({tweet => tweet.contains("@" + usuario) })

  // Obtener el listado de tweets a la nada, que son los tweets que no arroban a nadie
  method tweetsALaNada() = tweets.filter({ tweet => not tweet.any({palabra => palabra.contains("@")})  })
}

// Parte 2
class Imagen {
  const nombre
  const tamanoBytes

  method nombre() = nombre
  method tamanoBytes() = tamanoBytes
}
class Tweet {
  const palabras = []
  const imagen = ""

  method palabras() = palabras
  method imagen() = imagen
  method tieneImagen() = not (imagen == "")

  method contains(palabra) = palabras.contains(palabra)
  method any(bloque) = palabras.any(bloque)
  method size() = palabras.size()
}

// Parte 3 

// Qué pasa si ahora todo bot tiene que poder reportar a la policía?
/*
Aplico delegacion mediante: policia.recibirDenuncia(usuario, tweet).
los bots le dan  la tarea al objeto 'policia' para evitar repetir código.
*/

/*
class BotPublicidadConDenuncia {
  const palabraPuntual
  const mensaje
  const link
  const imagen = ""

  method quiereResponder(tweet) = tweet.any({ palabra => palabra == palabraPuntual })
  
  method responder(tweet, usuario) {
    if (self.quiereResponder(tweet)) {
      return mensaje + " " + link + " @" + usuario
    }
    return ""
  }

  // Delegación a la policía
  method reportarAPolicia(usuario, tweet) {
    policia.recibirDenuncia(usuario, tweet)
  }
}
*/

// Y si son sólo Benito y los que juntan datos? 
// Se agrega el método en Benito y en la clase BotRecolector, y se deja a BotPublicidad sin ese método.

/*
// En BotRecolector (clase) agregamos la delegación:
class BotRecolectorConDenuncia {
  const usuariosQueTwittearon = []
  
  method responder(tweet, usuario) {
    usuariosQueTwittearon.add(usuario)
  }
  
  method usuariosQueTwittearon() = usuariosQueTwittearon

  // Delegación
  method reportarAPolicia(usuario, tweet) {
    policia.recibirDenuncia(usuario, tweet)
  }
}

// Benito en este caso ya tiene la delegación en su método responder:

object benito {
  ...
  method responder(tweet, usuario) {
    if (self.quiereResponder(tweet)) {
      policia.recibirDenuncia(usuario, tweet) // Delegación 
    }
  }
}
*/