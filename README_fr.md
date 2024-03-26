<!--
Nota bene : ce README est automatiquement généré par <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Il NE doit PAS être modifié à la main.
-->

# Matrix-WhatsApp bridge pour YunoHost

[![Niveau d’intégration](https://dash.yunohost.org/integration/mautrix_whatsapp.svg)](https://dash.yunohost.org/appci/app/mautrix_whatsapp) ![Statut du fonctionnement](https://ci-apps.yunohost.org/ci/badges/mautrix_whatsapp.status.svg) ![Statut de maintenance](https://ci-apps.yunohost.org/ci/badges/mautrix_whatsapp.maintain.svg)

[![Installer Matrix-WhatsApp bridge avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mautrix_whatsapp)

*[Lire le README dans d'autres langues.](./ALL_README.md)*

> *Ce package vous permet d’installer Matrix-WhatsApp bridge rapidement et simplement sur un serveur YunoHost.*  
> *Si vous n’avez pas YunoHost, consultez [ce guide](https://yunohost.org/install) pour savoir comment l’installer et en profiter.*

## Vue d’ensemble

Une passerelle entre Matrix et WhatsApp empaquetée comme un service YunoHost.
Les messages, médias et notifications sont relayées entre un compte WhatsApp et un compte Matrix.
Avec l'option de connexion Relaybot, un compte Matrix peut inviter d'autres comptes Matrix dans un salon Matrix relayé avec un groupe WhatsApp, ainsi même des personnes sans compte WhatsApp peuvent communiquer avec des utilisateur.ice.s de WhatsApp.
La passerelle ["Mautrix-WhatsApp"](https://docs.mau.fi/bridges/go/whatsapp/index.html) consiste en un Service d'Application Matrix-Synapse et repose sur une base-de-données postgresql (mysql également possible).
C'est pourquoi [Synapse for YunoHost](https://github.com/YunoHost-Apps/synapse_ynh) doit être préalablemnet installé.

** Attention : sauvegardez et restaurez toujours les deux applications Yunohost matrix_synapse et mautrix_whatsapp en même temps!**


**Version incluse :** 0.10.6~ynh1
## Documentations et ressources

- Site officiel de l’app : <https://maunium.net/go/mautrix-whatsapp/>
- Documentation officielle de l’admin : <https://docs.mau.fi/bridges/go/whatsapp/index.html>
- Dépôt de code officiel de l’app : <https://github.com/mautrix/whatsapp>
- YunoHost Store : <https://apps.yunohost.org/app/mautrix_whatsapp>
- Signaler un bug : <https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/issues>

## Informations pour les développeurs

Merci de faire vos pull request sur la [branche `testing`](https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing).

Pour essayer la branche `testing`, procédez comme suit :

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing --debug
ou
sudo yunohost app upgrade mautrix_whatsapp -u https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing --debug
```

**Plus d’infos sur le packaging d’applications :** <https://yunohost.org/packaging_apps>
