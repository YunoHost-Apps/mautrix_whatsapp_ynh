# Une passerelle entre Matrix et WhatsApp pour YunoHost
[![How components fit togeter](https://camo.githubusercontent.com/857d5c90de07312a60e02ce89efe7f8ece86ab6b/68747470733a2f2f67617a697a6f76612e6e65742f7075622f6d6175747269782d77686174736170702e706e67)](https://docs.mau.fi/bridges/go/whatsapp/index.html)
[![Integration level](https://dash.yunohost.org/integration/mautrix-whatsapp.svg)](https://dash.yunohost.org/appci/app/mautrix-whatsapp)  
[![Install mautrix-whatsapp with YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=mautrix-whatsapp)

*[Read this readme in english.](./README.md)* 

> *Ce package vous permet d'installer mautrix-whatsapp rapidement et simplement sur un serveur Yunohost.  
Si vous n'avez pas YunoHost, regardez [ici](https://yunohost.org/#/install) pour savoir comment l'installer et en profiter.*

## Vue d'ensemble
Une passerelle entre Matrix et WhatsApp empaquetée comme un service YunoHost. Les messages, médias et notifications sont relayées entre un compte WhatsApp et un compte Matrix. Avec l'option de connexion Robot-Relai, 1 compte Matrix peut inviter d'autres comptes Matrix dans un salon Matrix relayé avec un groupe WhatsApp, ainsi même des personnes sans compte WhatsApp peuvent communiquer avec des utilisateur.ice.s de WhatsApp. La passerelle ["Mautrix-WhatsApp"](https://docs.mau.fi/bridges/go/whatsapp/index.html) consiste en un Service d'Application Matrix-Synapse et repose sur une base-de-données postgresql (mysql également possible). C'est pourquoi [Synapse for YunoHost](https://github.com/YunoHost-Apps/synapse_ynh) doit être préalablemnet installé.

** Attention : sauvegardez et restaurez toujours les deux applications Yunohost matrix_synapse et mautrix_whatsapp en même temps!**

**Version incluse:** 0.3.0

## Captures d'écran

![](Lien vers une capture d'écran pour cette application)

## Liste de passerelles publiques

* Demandez sur un des salons suivants: #mautrix_yunohost:matrix.fdn.fr or #whatsapp:maunium.net

## Usages de la passerelle
** Notez que plusieurs comptes WhatsApp et Matrix peuvent être relayés, chaque compte WhatsApp connecté a son propre Salon d'Administration. Si plusieurs utilisateur.ice.s du Robot sont dans un même groupe WhatsApp, seul un Salon Matrix sera créé par la passerelle. **

### Relayer TOUTES les conversations entre UN compte WhatsApp et UN compte Matrix
* Prérequis : votre compte Matrix ou le serveur sur lequel il est hébergé doit être autorisé dans la configuration de la passerelle (voir ci-dessous)
* Invitez le Robot (par défaut @whatsappbot:synapse.votredomaine) à une nouvelle conversation.
* Ce nouveau salon d'administration du Robot Mautrix-WhatsApp est appelé "Administration Room".
* Tapez ``login``
* Scannez le QR-code avec la caméra Whatsapp de votre Machine Virtuelle ou ordiphone (option WhatsApp Web dans l'appli)
* Envoyez ``help`` au Robot dans le "Administration Room" pour une liste des commandes d'administration de la passerelle.
Voir aussi [upstream wiki Authentication page](https://docs.mau.fi/bridges/go/whatsapp/authentication.html)



### Robot-Relai "Relaybot": Relayer les conversations de TOUS les comptes Matrix et TOUS les comptes WhatsApp présents dans UN groupe/salon
* Prérequis : Créer un nouveau salon vide "Relaybot Administration Room" et rechercher son identifiant.
* Activer l'option Robot-Relai "Relaybot" dans la configuration de la passerelle (default=disabled, voir ci-dessous) et ajouter l'identifiant du salon d'administration du Relaybot "Relaybot Administration Room".
* Redémarrer le service mautrix_whatsapp
* Vous pouvez maintenant relayer un groupe WhatsApp en y invitant le numéro de téléphone du compte WhatsApp connecté au RobotRelai. Côté WhatsApp, tous les messages venant de Matrix seront vus comme envoyés depuis le compte WhatsApp connecté, avec un préfix indiquant le compte Matrix correspondant. Côté Matrix, la passerelle va créer des comptes Matrix pour chaque compte WhatsApp présent dans le groupe relayé. Les messages sont indiqués comme provenant soit du numéro de téléphone, soit du pseudo WhatsApp.
Voir aussi [la page wiki principale sur le Robot-Relai](https://docs.mau.fi/bridges/go/whatsapp/relaybot.html)

## Configuration de la passerelle

La passerelle est [configurée avec les paramètres standards adaptés pour votre YunoHost et l'instance Matrix-Synapse sélectionnée](https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/blob/master/conf/config.yaml). Vous pouvez par exemple ajouter des administrateur.ice.s et utilisateur.ice.s du Robot autorisés en modifiant le fichier de configuration par liaison SSH: 
``` sudo nano /opt/yunohost/mautrix_whatsapp/config.yaml```
puis en redémarrant le service: 
``` sudo yunohost service restart mautrix_whatsapp```

## Documentation

 * Documentation officielle "Mautrix-WhatsApp": https://docs.mau.fi/bridges/go/whatsapp/index.html
 * Salon Matrix sur les Passerelles dans Yunohost): #mautrix_yunohost:matrix.fdn.fr
 * Salon Matrix (application principale): #whatsapp:maunium.net
Si vous devez téléverser vos fichiers log quelque-part, soyez avertis qu'ils contiennent des informations sur vos contacts et vos numéros de téléphone. Effacez-les avec 
``| sed -r 's/[0-9]{10,}/📞/g' ``
 * La passerelle "Mautrix-WhatsApp" repose sur l'implémentation [Rhymen/go-whatsapp](https://github.com/Rhymen/go-whatsapp) du projet [sigalor/whatsapp-web-reveng](https://github.com/sigalor/whatsapp-web-reveng). 
 * Documentation YunoHost: Si une documentation spécifique est nécessaire, n'hésitez pas à contribuer.

## Caractéristiques spécifiques YunoHost

#### Support multi-comptes
* Les utilisateur.ice.s du Robot ne sont pas liés aux comptes Yunohost. N'importe quel compte Matrix ou serveur Synapse autorisés dans la configuration de la passerelle peut inviter/utiliser le Robot. 
* Le robot WhatsApp est un utilisateur Matrix-Synapse local, mais accessible via la fédération (Synapse public ou privé).
* Plusieurs comptes WhatsApp et Matrix peuvent être liés avec une seule passerelle, chaque compte a son propre salon d'administration. 
* Si plusieurs utilisateur.ice.s du Robot sont dans un même groupe WhatsApp, seul un Salon Matrix sera créé par la passerelle. Autrement dit, la passerelle construit un seul miroir du réseau de discussion existant sur WhatsApp (utilisateurs et salons).
* Voir https://github.com/YunoHost-Apps/synapse_ynh#multi-users-support

#### Support multi-instance

* L'installation multi-instance devrait fonctionner. Plusieurs instances de passerelles pourraient être installées pour une instance de Matrix-Synapse. Cela permet à un compte matrix de se relier à plusieurs comptes WhatsApp. 
* Plusieurs instances de passerelles pourraient être installées pour que chaque instance de Matrix-Synapse puisse en bénéficier. Mais une passerelle peut être utilisée par les comptes de plusieurs instances Matrix-Synapse.

#### Architectures supportées

* Testé sur ARMv7 en Avril 2020
* x86-64b - [![Build Status](https://ci-apps.yunohost.org/ci/logs/mautrix_whatsapp%20%28Apps%29.svg)](https://ci-apps.yunohost.org/ci/apps/mautrix_whatsapp/)
* ARMv8-A - [![Build Status](https://ci-apps-arm.yunohost.org/ci/logs/mautrix_whatsapp%20%28Apps%29.svg)](https://ci-apps-arm.yunohost.org/ci/apps/mautrix_whatsapp/)

## Limitations

* Les appels Audio/Video ne sont pas relayés. Seule une notification apparait. 
* Si WhatsApp perd la connexion, par ex. l'ordiphone est mis en mode avion ou les notifications poussées sont désactivées, le robot doit parfois être redémarré à la main en envoyant un message ``wa !reconnnect`` dans le salon d'administration.

## Informations additionnelles

* It is recommended to install WhatsApp on a virtual android running on a server, see [upstream wiki Android-VM-Setup page](https://docs.mau.fi/bridges/go/whatsapp/android-vm-setup.html) 

**Plus d'informations sur la page de documentation:** 

* https://docs.mau.fi/bridges/go/whatsapp/index.html 
* https://yunohost.org/packaging_apps

## Liens

 * Signaler un bug:  https://github.com/YunoHost-Apps/mautrix-whatsapp_ynh/issues
 * Site de l'application: https://github.com/YunoHost-Apps/mautrix-whatsapp_ynh
 * Documentation de l'application principale: https://docs.mau.fi/bridges/go/whatsapp/index.html
 * Dépôt de l'application principale: https://github.com/mautrix/whatsapp
 * Up-Upstream repository: https://github.com/Rhymen/go-whatsapp
 * Up-Up-Upstream repository: https://github.com/sigalor/whatsapp-web-reveng
 * Site web YunoHost: https://yunohost.org/

---

Informations pour les développeurs
----------------

**Seulement si vous voulez utiliser une branche de test pour le codage, au lieu de fusionner directement dans la banche principale.**
Merci de faire vos pull request sur la [branche testing](https://github.com/YunoHost-Apps/mautrix-whatsapp_ynh/tree/testing).

Pour essayer la branche testing, procédez comme suit.
```
sudo yunohost app install https://github.com/YunoHost-Apps/mautrix-whatsapp_ynh/tree/testing --debug
ou
sudo yunohost app upgrade mautrix-whatsapp -u https://github.com/YunoHost-Apps/mautrix-whatsapp_ynh/tree/testing --debug
```

Pour tester la communication entre le Service d'Application et Matrix-Synapse sur une Machine Virtuelle (ex. avec un nom de domaine: synapse.vm), vous devez installer un certificat:
```
echo | openssl s_client -showcerts -servername synapse.vm -connect synapse.vm:443 2>/dev/null | awk '/-----BEGIN CERTIFICATE-----/, /-----END CERTIFICATE-----/' >> /usr/local/share/ca-certificates/synapse.vm.crt
update-ca-certificates
```
