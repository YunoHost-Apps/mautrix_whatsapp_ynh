Une passerelle entre Matrix et WhatsApp empaquetée comme un service YunoHost.
Les messages, médias et notifications sont relayées entre un compte WhatsApp et un compte Matrix.
Avec l'option de connexion Robot-Relai, 1 compte Matrix peut inviter d'autres comptes Matrix dans un salon Matrix relayé avec un groupe WhatsApp, ainsi même des personnes sans compte WhatsApp peuvent communiquer avec des utilisateur.ice.s de WhatsApp.
La passerelle ["Mautrix-WhatsApp"](https://docs.mau.fi/bridges/go/whatsapp/index.html) consiste en un Service d'Application Matrix-Synapse et repose sur une base-de-données postgresql (mysql également possible).
C'est pourquoi [Synapse for YunoHost](https://github.com/YunoHost-Apps/synapse_ynh) doit être préalablemnet installé.

** Attention : sauvegardez et restaurez toujours les deux applications Yunohost matrix_synapse et mautrix_whatsapp en même temps!**
