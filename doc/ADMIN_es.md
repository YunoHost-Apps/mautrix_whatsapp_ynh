## Configuración del puente
El puente está [configurado a grandes rasgos en la instalación](https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/blob/master/conf/config.yaml), por ejemplo, se permite admin y usuarix del bot.
Se puede hacer una configuración más fina usando el panel de configuración existente en el panel de administración de Yunohost o modificando el
siguiente archivo de configuración con SSH:
```/var/www/mautrix_whatsapp/config.yaml```
y reiniciando el servicio mautrix_whatsapp.

#### Cifrado de extremo a puente
El puente puede cifrar opcionalmente los mensajes entre lxs usuarixs de Matrix y él mismo para ocultar los mensajes del servidor doméstico. Se recomienda encarecidamente el uso de Postgres cuando se utilice el cifrado de extremo a puente.

Si se desea habilitar, se debe ir a la sección del panel de configuración `Privacidad -> Salas y configuración de cifrado`. Si se activa `¿Permitir la encriptación entre el cliente Matrix y el puente?`, el puente no activará la encriptación por sí mismo, pero funcionará en salas encriptadas.
Alternativamente, aparecerán dos opciones más, `Forzar la encriptación en todas las salas que cree el puente`, que habilitará automáticamente la encriptación en las nuevas salas, y `Requerir encriptación`, que forzará la encriptación en cualquiera de los mensajes que envíe (esto hará que el puente elimine cualquier futuro mensaje no encriptado).

También existe la posibilidad de configurarlo en el fichero YAML de configuración del puente en la sección `bridge: encryption`.