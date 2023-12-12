## Multi-user support
* Bot users are not related to Yunohost users. Any Matrix account or Synapse server autorized in the configuration of the bridge can invite/use the bot.
* The WhatsApp bot is a local Matrix-Synapse user, but accessible through federation (synapse public or private).
* Several WhatsApp and Matrix users can be bridged with one bridge, each user has its own bot administration room.
* If several bot users are in a same WhatsApp group, only one Matrix room will be created by the bridge.
* See https://github.com/YunoHost-Apps/synapse_ynh#multi-users-support

## Limitations
* Audio/Video calls are not bridged yet.
* If WhatsApp loses connection, e.g. the phone is set in flight mode or push notifications are deactivated, the bot has sometimes to be restarted manually by sending `!wa reconnnect` in the Matrix administration room.
* WhatsApp needs to get presence from the official app every two weeks at least, so bridge will send a reminder in the administration room.

## Additional information
* It is recommended to install WhatsApp on a virtual android running on a server, see [upstream wiki Android-VM-Setup page](https://docs.mau.fi/bridges/go/whatsapp/android-vm-setup.html)
**More information on the documentation page:**
  https://docs.mau.fi/bridges/go/whatsapp/index.html

To test communication between the App Service and Matrix-Synapse on a VM (e.g. with domain name: synapse.vm), you must install a certificate:
```
echo | openssl s_client -showcerts -servername synapse.vm -connect synapse.vm:443 2>/dev/null | awk '/-----BEGIN CERTIFICATE-----/, /-----END CERTIFICATE-----/' >> /usr/local/share/ca-certificates/synapse.vm.crt
update-ca-certificates
```

## Miscellaneous information
* Matrix room (matrix bridges in YunoHost): #mautrix_yunohost:matrix.fdn.fr
* Matrix room (upstream app): #whatsapp:maunium.net
  In case you need to upload your logs somewhere, be aware that they contain your contacts and your phone numbers. Strip them out with:
  ``| sed -r 's/[0-9]{10,}/📞/g' ``
* "Mautrix-WhatsApp" bridge is based on the [Rhymen/go-whatsapp](https://github.com/Rhymen/go-whatsapp) implementation of the [sigalor/whatsapp-web-reveng](https://github.com/sigalor/whatsapp-web-reveng) project.