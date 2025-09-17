### Configuration de la passerelle
La passerelle est [configurée avec les paramètres standards adaptés pour votre YunoHost et l'instance Matrix-Synapse sélectionnée](https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/blob/master/conf/config.yaml).
Une configuration plus fine peut être effectuée en utilisant le panneau de configuration existant dans le panneau d'administration de Yunohost ou en modifiant le fichier de configuration suivant avec SSH:
```/var/www/mautrix_whatsapp/config.yaml```
puis en redémarrant le service mautrix_whatsapp.

#### User permissions


#### End-to-bridge encryption
Le robot peut éventuellement chiffrer les messages entre les utilisateurs de Matrix et la passarelle pour cacher les messages du serveur domestique. L'utilisation de Postgres est fortement recommandée lors de l'utilisation du chiffrement end-to-bridge.

Si vous voulez l'activer, allez dans la section `Privacy -> Portal Rooms & Encryption Settings` du panneau de configuration. Si vous activez `Allow Encryption between Matrix Client and Bridge Server?`, la passarelle n'activera pas le cryptage d'elle-même, mais fonctionnera dans les salles cryptées.
Sinon, deux autres options apparaissent, `Force-enable Encryption in all Portal Rooms the Bridge creates?` qui activera automatiquement le cryptage dans les nouveaux portails et `Require encryption?` qui imposera le cryptage sur tous les messages que vous envoyez (ce qui fera que le robot abandonnera tous les messages non cryptés à l'avenir).

Il est également possible de le configurer dans le fichier YAML de configuration du robot dans la section `bridge: encryption`.