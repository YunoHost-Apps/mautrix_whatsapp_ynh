## Lista de servicios públicos conocidos
* Pregunta en una de las siguientes salas #mautrix_yunohost:matrix.fdn.fr o #whatsapp:maunium.net

## Uso del puente
** Ten en cuenta que se pueden puentear varixs usuarixs de WhatsApp y Matrix, cada cuenta de WhatsApp tiene su propia sala de administración de bots. Si están en un mismo grupo de WhatsApp, sólo se creará una sala de Matrix. **

### Puentear una cuenta de WhatsApp y con otra de Matrix
* En primer lugar, el/la usuarix o servidor de Matrix debe estar autorizado en la configuración del puente (véase más abajo).
* A continuación, invite al bot (por defecto @whatsappbot:yoursynapse.domain)
* La sala con el bot de Mautrix-WhatsApp se llama "Administration Room".
* Escribe `login`
* Captura el código QR con la cámara del WhatsApp de tu VM o smartphone (WhatsApp Web)
* Envía `help` al bot en la sala creada para saber cómo controlarlo.
  Ver también [upstream wiki Authentication page](https://docs.mau.fi/bridges/go/whatsapp/authentication.html)

### Puentear una sala existente
Por defecto, el puente crea una sala para cada grupo de WhatsApp que el/la usuarix de WhatsApp utiliza activamente.
También puede crear una sala de Matrix existente. **Tenga en cuenta que puede tratarse de una sala creada por otro puente, por ejemplo, una sala de Signal**.
1. Invita al bot del puente a la sala (con una cuenta autorizada).
2. Escriba `!wa create`.
3. Tu usuarix conectadx crea un nuevo grupo correspondiente.
4. Obtén el enlace de invitación `!wa invite-link` y compártelo con tus amigxs o invita a las marionetas de WhatsApp a la sala.
5. Opcional: Activar relaybot, ver siguiente sección.

### Relaybot: Puentea un grupo para que varixs usuarixs de Matrix y varixs usuarixs de WhatsApp chateen juntxs.
Para poder hacer puente no sólo con tu cuenta de Matrix conectada sino también con los amigxs de Matrix que invites a una sala, necesitas:
1. Habilitar la configuración de Relaybot en la sección del panel de configuración `Configuración principal -> Configuración del puente de marionetas` o en el archivo YAML de configuración del puente `relay: enabled: true`. También asegúrate de que lxs usuarixs que quieres invitar tienen al menos el nivel `relay` en la sección `permissions` (esto también se puede configurar en la sección del panel de configuración `Main Settings -> Permissions for using the bridge`).
2. Accede a tu cuenta de WhatsApp en la sala de administración.
3. Dependiendo de lo que se haya seleccionado durante la instalación, esto podrían hacerlo solo lxs administradorxs, pero también se puede cambiar en la sección del panel de configuración `Main Settings -> Puppetting Bridge Settings` o en el archivo YAML de configuración del puente `relay: admin_only`.
4. Escribe `!wa set-relay` en cada una de las salas que quieras retransmitir para (re)activar la función Relaybot.

* En WhatsApp: todos los mensajes se verán como recibidos de la cuenta que ha iniciado sesión con un prefijo para el/la usuarix de Matrix de origen.
* En el lado de Matrix: el puente creará marionetas de Matrix correspondientes a lxs usuarixs de WhatsApp cuando envíen un mensaje.
  Véase también [upstream wiki Relaybot page](https://docs.mau.fi/bridges/general/relay-mode.html)