function fn() {
var env = karate.env;
var baseUrl = '';
var emailUser = '';
var passwordUser = '';

karate.log('Se realiza la ejecución en el entorno: ' + env);

//Declaracion de variables por entorno
emailUser = karate.properties['email-User']
passwordUser = karate.properties['password-User']

    if (!env) {
  env = 'dev';
   }

    if (env === 'dev') {
        baseUrl = 'https://serverest.dev';
    } else if (env === 'cert') {
        baseUrl = 'https://serverest.dev';
    }

  var config = {
    baseUrl: baseUrl,
    env: env,
    emailUser: emailUser,
    passwordUser: passwordUser,
  }
    return config;

}


