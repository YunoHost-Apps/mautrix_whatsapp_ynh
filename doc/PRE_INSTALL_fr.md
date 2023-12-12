## Support multi-comptes
* Les utilisateur.ice.s du Robot ne sont pas liés aux comptes Yunohost. N'importe quel compte Matrix ou serveur Synapse autorisés dans la configuration de la passerelle peut inviter/utiliser le Robot.
* Le robot WhatsApp est un utilisateur.ice.s Matrix-Synapse local, mais accessible via la fédération (Synapse public ou privé).
* Plusieurs comptes WhatsApp et Matrix peuvent être liés avec une seule passerelle, chaque compte a son propre salon d'administration.
* Si plusieurs utilisateur.ice.s du Robot sont dans un même groupe WhatsApp, seul une salle de Matrix sera créé par la passerelle. Autrement dit, la passerelle construit un seul miroir du réseau de discussion existant sur WhatsApp (utilisateur.ice.s et salles).
* Voir https://github.com/YunoHost-Apps/synapse_ynh#multi-users-support

## Limitations
* Les appels Audio/Video ne sont pas relayés. Seule une notification apparait.
* Si WhatsApp perd la connexion, par ex. l'ordiphone est mis en mode avion ou les notifications poussées sont désactivées, le robot doit parfois être redémarré à la main en envoyant un message `!wa reconnnect` dans le salon d'administration.
* WhatsApp doit obtenir la présence de l'application officielle toutes les deux semaines au moins, c'est pourquoi le robot enverra un rappel dans la salle d'administration.

## Informations additionnelles
* Il est recommandé d'installer WhatsApp sur une machine Android virtuelle  tournant sur un serveur, cf. le [page Android-VM-Setup du wiki](https://docs.mau.fi/bridges/go/whatsapp/android-vm-setup.html)
**Plus d'informations sur la page de documentation:**
  https://docs.mau.fi/bridges/go/whatsapp/index.html

* Pour tester la communication entre le Service d'Application et Matrix-Synapse sur une Machine Virtuelle (ex. avec un nom de domaine: synapse.vm), vous devez installer un certificat:
```
echo | openssl s_client -showcerts -servername synapse.vm -connect synapse.vm:443 2>/dev/null | awk '/-----BEGIN CERTIFICATE-----/, /-----END CERTIFICATE-----/' >> /usr/local/share/ca-certificates/synapse.vm.crt
update-ca-certificates
```

## Informations diverses
* Salle Matrix sur les Passerelles dans Yunohost: #mautrix_yunohost:matrix.fdn.fr
* Salle Matrix (application principale): #whatsapp:maunium.net
  Si vous devez téléverser vos fichiers log quelque-part, soyez avertis qu'ils contiennent des informations sur vos contacts et vos numéros de téléphone. Effacez-les avec:
  ``| sed -r 's/[0-9]{10,}/📞/g' ``
* La passerelle "Mautrix-WhatsApp" repose sur l'implémentation [Rhymen/go-whatsapp](https://github.com/Rhymen/go-whatsapp) du projet [sigalor/whatsapp-web-reveng](https://github.com/sigalor/whatsapp-web-reveng).