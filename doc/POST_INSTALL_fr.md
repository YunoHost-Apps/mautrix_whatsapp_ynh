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

1. Activer l'option `Should Relay Mode be allowed?` dans le panneau de configuration (section `Main Settings -> Puppetting Bridge Settings`) ou dans le fichier YAML de configuration du robot `relay: enabled: true`. Assurez-vous également que les utilisateurs que vous voulez inviter ont au moins le niveau `relay` dans la section `permissions` (ceci peut être configuré dans la section `Main Settings -> Permissions for using the bridge` du panneau de configuration).
2. En fonction de ce qui a été sélectionné lors de l'installation, cela peut être fait uniquement par les administrateurs, mais peut également être modifié dans la section `Main Settings -> Puppetting Bridge Settings` du panneau de configuration ou dans le fichier YAML de configuration du robot `relay: admin_only`
3. Ecrivez `!wa set-relay` dans chacune des pièces que vous voulez relayer pour (ré)activer la fonction de relaybot.

* Vous pouvez maintenant relayer un groupe WhatsApp en y invitant le numéro de téléphone du compte WhatsApp connecté au RobotRelai. Côté WhatsApp, tous les messages venant de Matrix seront vus comme envoyés depuis le compte WhatsApp connecté, avec un préfix indiquant le compte Matrix correspondant. Côté Matrix, la passerelle va créer des comptes Matrix pour chaque compte WhatsApp présent dans le groupe relayé. Les messages sont indiqués comme provenant soit du numéro de téléphone, soit du pseudo WhatsApp.
  Voir aussi [la page wiki principale sur le Robot-Relai](https://docs.mau.fi/bridges/go/whatsapp/relaybot.html)