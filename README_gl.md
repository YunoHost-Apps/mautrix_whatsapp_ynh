<!--
NOTA: Este README foi creado automáticamente por <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
NON debe editarse manualmente.
-->

# Matrix-WhatsApp bridge para YunoHost

[![Nivel de integración](https://apps.yunohost.org/badge/integration/mautrix_whatsapp)](https://ci-apps.yunohost.org/ci/apps/mautrix_whatsapp/)
![Estado de funcionamento](https://apps.yunohost.org/badge/state/mautrix_whatsapp)
![Estado de mantemento](https://apps.yunohost.org/badge/maintained/mautrix_whatsapp)

[![Instalar Matrix-WhatsApp bridge con YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mautrix_whatsapp)

*[Le este README en outros idiomas.](./ALL_README.md)*

> *Este paquete permíteche instalar Matrix-WhatsApp bridge de xeito rápido e doado nun servidor YunoHost.*  
> *Se non usas YunoHost, le a [documentación](https://yunohost.org/install) para saber como instalalo.*

## Vista xeral

A puppeting bridge between Matrix and WhatsApp packaged as a YunoHost service.
Messages, media and notifications are bridged between a WhatsApp user and a matrix user.
With the RelayBot login option, the matrix user can invite other matrix user in a bridged WhatsApp room, such that even people without a WhatsApp account can participate to WhatsApp group conversations.
The ["Mautrix-WhatsApp"](https://docs.mau.fi/bridges/go/whatsapp/index.html) bridge consists in a synapse app service and relies on postgresql (mysql also available).
Therefore, [Synapse for YunoHost](https://github.com/YunoHost-Apps/synapse_ynh) should be installed beforehand.

** Attention: always backup and restore the Yunohost matrix_synapse et mautrix_whatsapp apps together!**


**Versión proporcionada:** 0.11.2~ynh1
## Documentación e recursos

- Web oficial da app: <https://maunium.net/go/mautrix-whatsapp/>
- Documentación oficial para admin: <https://docs.mau.fi/bridges/go/whatsapp/index.html>
- Repositorio de orixe do código: <https://github.com/mautrix/whatsapp>
- Tenda YunoHost: <https://apps.yunohost.org/app/mautrix_whatsapp>
- Informar dun problema: <https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/issues>

## Info de desenvolvemento

Envía a túa colaboración á [rama `testing`](https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing).

Para probar a rama `testing`, procede deste xeito:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing --debug
ou
sudo yunohost app upgrade mautrix_whatsapp -u https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing --debug
```

**Máis info sobre o empaquetado da app:** <https://yunohost.org/packaging_apps>
