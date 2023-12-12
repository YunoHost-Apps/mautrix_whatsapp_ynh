## Soporte multiusuarix
* Lxs usuarixs del bot no están relacionadxs con lxs usuarixs de Yunohost. Cualquier cuenta Matrix o servidor Synapse autorizado en la configuración del puente puede invitar/usar el bot.
* El bot de WhatsApp es un usuarix local Matrix-Synapse, pero accesible a través de federación (synapse público o privado).
* Varios usuarixs de WhatsApp y Matrix pueden ser puenteadxs con un puente, cada usuarix tiene su propia sala de administración bot.
* Si varixs usuarixs bot están en un mismo grupo de WhatsApp, el puente sólo creará una sala de Matrix.
* Véase https://github.com/YunoHost-Apps/synapse_ynh#multi-users-support

## Limitaciones
* Las llamadas de audio/vídeo aún no están conectadas. Solo aparece una notificación.
* Si WhatsApp pierde la conexión, por ejemplo, si el teléfono se pone en modo de vuelo o se desactivan las notificaciones push, a veces hay que reiniciar el bot manualmente enviando `!wa reconnnect` en la sala de administración de Matrix.
* WhatsApp necesita obtener presencia de la app oficial cada dos semanas como mínimo, por lo que el puente enviará un recordatorio en la sala de administración.

## Información adicional
* Se recomienda instalar WhatsApp en Android dentro de una máquina virtual que se ejecute en un servidor, consulte [wiki Android-VM-Setup page](https://docs.mau.fi/bridges/go/whatsapp/android-vm-setup.html)
**Más información en la página de documentación:**
  https://docs.mau.fi/bridges/go/whatsapp/index.html

* Para probar la comunicación entre el App Service y Matrix-Synapse en una máquina virtual (por ejemplo, con nombre de dominio: synapse.vm), se debe instalar un certificado:
```
echo | openssl s_client -showcerts -servername synapse.vm -connect synapse.vm:443 2>/dev/null | awk '/-----BEGIN CERTIFICATE-----/, /-----END CERTIFICATE-----/' >> /usr/local/share/ca-certificates/synapse.vm.crt
update-ca-certificates
```

## Informaciones diversas
* Sala de Matrix (puentes de Matrix en YunoHost): #mautrix_yunohost:matrix.fdn.fr
* Sala de Matrix (aplicación original): #mautrix_yunohost:matrix.fdn.fr
  En caso de que necesites subir tus logs a algún sitio, ten en cuenta que contienen tus contactos y sus números de teléfono. Elimínalos con:
  ``| sed -r 's/[0-9]{10,}/📞/g' ``
* El puente "Mautrix-WhatsApp" está basado en la implementación [Rhymen/go-whatsapp](https://github.com/Rhymen/go-whatsapp) del proyecto [sigalor/whatsapp-web-reveng](https://github.com/sigalor/whatsapp-web-reveng).