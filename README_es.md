<!--
Este archivo README esta generado automaticamente<https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
No se debe editar a mano.
-->

# Matrix-WhatsApp bridge para Yunohost

[![Nivel de integración](https://apps.yunohost.org/badge/integration/mautrix_whatsapp)](https://ci-apps.yunohost.org/ci/apps/mautrix_whatsapp/)
![Estado funcional](https://apps.yunohost.org/badge/state/mautrix_whatsapp)
![Estado En Mantención](https://apps.yunohost.org/badge/maintained/mautrix_whatsapp)

[![Instalar Matrix-WhatsApp bridge con Yunhost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mautrix_whatsapp)

*[Leer este README en otros idiomas.](./ALL_README.md)*

> *Este paquete le permite instalarMatrix-WhatsApp bridge rapidamente y simplement en un servidor YunoHost.*  
> *Si no tiene YunoHost, visita [the guide](https://yunohost.org/install) para aprender como instalarla.*

## Descripción general

Un puente de marionetas entre Matrix y WhatsApp empaquetado como un servicio YunoHost.
Mensajes, medios de comunicación y las notificaciones son puenteados entre una cuenta de WhatsApp y una cuenta de Matrix.
Con la opción de inicio de sesión RelayBot, una persona de Matrix puede invitar a otra persona de Matrix a una sala de WhatsApp puenteada, de modo que incluso personas sin cuenta de WhatsApp pueden participar en conversaciones de grupo de WhatsApp.
El puente ["Mautrix-WhatsApp"](https://docs.mau.fi/bridges/go/whatsapp/index.html) consiste en un servicio de la aplicación Synapse y se basa en Postgresql (Mysql también disponible).
Por lo tanto, debe instalarse previamente [Synapse para YunoHost](https://github.com/YunoHost-Apps/synapse_ynh).

** Atención: haz siempre copias de seguridad y restaura las aplicaciones Yunohost matrix_synapse y mautrix_whatsapp juntas.

**Versión actual:** 0.11.4~ynh1
## Documentaciones y recursos

- Sitio web oficial: <https://maunium.net/go/mautrix-whatsapp/>
- Documentación administrador oficial: <https://docs.mau.fi/bridges/go/whatsapp/index.html>
- Repositorio del código fuente oficial de la aplicación : <https://github.com/mautrix/whatsapp>
- Catálogo YunoHost: <https://apps.yunohost.org/app/mautrix_whatsapp>
- Reportar un error: <https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/issues>

## Información para desarrolladores

Por favor enviar sus correcciones a la [rama `testing`](https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing).

Para probar la rama `testing`, sigue asÍ:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing --debug
o
sudo yunohost app upgrade mautrix_whatsapp -u https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing --debug
```

**Mas informaciones sobre el empaquetado de aplicaciones:** <https://yunohost.org/packaging_apps>
