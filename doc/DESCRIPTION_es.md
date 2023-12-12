Un puente de marionetas entre Matrix y WhatsApp empaquetado como un servicio YunoHost.
Mensajes, medios de comunicación y las notificaciones son puenteados entre una cuenta de WhatsApp y una cuenta de Matrix.
Con la opción de inicio de sesión RelayBot, una persona de Matrix puede invitar a otra persona de Matrix a una sala de WhatsApp puenteada, de modo que incluso personas sin cuenta de WhatsApp pueden participar en conversaciones de grupo de WhatsApp.
El puente ["Mautrix-WhatsApp"](https://docs.mau.fi/bridges/go/whatsapp/index.html) consiste en un servicio de la aplicación Synapse y se basa en Postgresql (Mysql también disponible).
Por lo tanto, debe instalarse previamente [Synapse para YunoHost](https://github.com/YunoHost-Apps/synapse_ynh).

** Atención: haz siempre copias de seguridad y restaura las aplicaciones Yunohost matrix_synapse y mautrix_whatsapp juntas.