### List of known public services

* Ask on one of the following rooms: #mautrix_yunohost:matrix.fdn.fr or #whatsapp:maunium.net

### Bridging usage
** Note that several WhatsApp and Matrix users can be bridged, each WhatsApp account has its own bot administration room. If they are in a same WhatsApp group, only one matrix room will be created. **

#### Bridge a WhatsApp user and a Matrix user
* First your matrix user or server has to be authorized in the bridge configuration (see below)
* Then, invite the bot (default @whatsappbot:yoursynapse.domain) 
* The room with the Mautrix-WhatsApp bot is called "administration room".
* Type ``login``
* Capture the QR code with the camera in the whatsapp of your VM or smartphone (WhatsApp Web)
* Send ``help`` to the bot in the created room to know how to control the bot.
See also [upstream wiki Authentication page](https://docs.mau.fi/bridges/go/whatsapp/authentication.html)

#### Bridge an existing room | Bridge Whatsapp to Signal over Matrix
By default, the bridge creates a portal room for each WA group that the WA user actively uses.
Your can also create a portal for an existing Matrix room. **Note that this can be a room created by another bridge, e.g. a Signal portal room**
1. Invite the bridge bot to the room (with an authorized user)
2. type `!wa create`
3. Your logged in WA user creates a new corresponding group. 
4. Get the WA invite link `!wa invite-link` and share it with friends. Or invite Whatsapp puppets to room.
5. Optional: Activate relaybot, see next section.

#### Relaybot: Bridge a group for several Matrix and several WhatsApp users to chat together
**When upgrading from <v0.2.0, the relaybot system changed. There is no relaybot administration room anymore. Relay must be re-activated in all rooms**. 

To be able to bridge not only your logged in Matrix account but also Matrix friends you invite to a portal room, you need to:
1. enable relaybot setting in the bridge configuration `relay: enabled: true`
2. login to your WhatsApp account in the (main) administration room
3. write `!wa set-relay` in each of the rooms you want to relay to (re-)activate the relaybot function. By default, only bridge admin can do this, see setting `admin_only: true`

* In WhatsApp: all messages will be seen as received from the account who is logged in with a prefix for the source matrix user. 
* On the matrix side: the bridge will create matrix puppets corresponding to the WhatsApp users when they send a message.
See also [upstream wiki Relaybot page](https://docs.mau.fi/bridges/general/relay-mode.html)

### Configuration of the bridge

The bridge is [roughly configured at installation](https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/blob/master/conf/config.yaml), e.g. allowed admin and user of the bot. Finer configuration can be done by modifying the
following configuration file with SSH: 
```/opt/yunohost/mautrix_whatsapp/config.yaml```
and then restarting the mautrix_whatsapp service.

### Multi-users support

* Bot users are not related to Yunohost users. Any Matrix account or Synapse server autorized in the configuration of the bridge can invite/use the bot. 
* The WhatsApp bot is a local Matrix-Synapse user, but accessible through federation (synapse public or private).
* Several Signal and Matrix users can be bridged with one bridge, each user has its own bot administration room. 
* If several bot users are in a same WhatsApp group, only one Matrix room will be created by the bridge.
* See https://github.com/YunoHost-Apps/synapse_ynh#multi-users-support

### Multi-instance support

* Multi-instance installation should work. Several bridge instances could be installed for one Matrix-Synapse instance so that one Matrix user can bridge several WhatsApp accounts. 
* Several bridge instances could be installed for each Matrix-Synapse instance to benefit from it. But one bridge can be used by users from several Matrix-Synapse instances.

### Supported architectures

ARM, ARM64, AMD64

### Limitations

* Audio/Video calls are not bridged yet. 
* If WhatsApp loses connection, e.g. the phone is set in flight mode or push notifications are deactivated, the bot has sometimes to be restarted manually by sending a reconnnect message in the matrix administration room.

### Additional information

* It is recommended to install WhatsApp on a virtual android running on a server, see [upstream wiki Android-VM-Setup page](https://docs.mau.fi/bridges/go/whatsapp/android-vm-setup.html) 
**More information on the documentation page:**  
https://docs.mau.fi/bridges/go/whatsapp/index.html

To test communication between the App Service and Matrix-Synapse on a VM (e.g. with domain name: synapse.vm), you must install a certificate:
```
echo | openssl s_client -showcerts -servername synapse.vm -connect synapse.vm:443 2>/dev/null | awk '/-----BEGIN CERTIFICATE-----/, /-----END CERTIFICATE-----/' >> /usr/local/share/ca-certificates/synapse.vm.crt
update-ca-certificates
```

### Miscellaneous information

 * Matrix room (matrix bridges in YunoHost): #mautrix_yunohost:matrix.fdn.fr
 * Matrix room (upstream app): #whatsapp:maunium.net
In case you need to upload your logs somewhere, be aware that they contain your contacts' and your phone numbers. Strip them out with 
``| sed -r 's/[0-9]{10,}/📞/g' ``
 * "Mautrix-WhatsApp" bridge is based on the [Rhymen/go-whatsapp](https://github.com/Rhymen/go-whatsapp) implementation of the [sigalor/whatsapp-web-reveng](https://github.com/sigalor/whatsapp-web-reveng) project.

