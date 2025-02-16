<!--
To README zostało automatycznie wygenerowane przez <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Nie powinno być ono edytowane ręcznie.
-->

# Matrix-WhatsApp bridge dla YunoHost

[![Poziom integracji](https://apps.yunohost.org/badge/integration/mautrix_whatsapp)](https://ci-apps.yunohost.org/ci/apps/mautrix_whatsapp/)
![Status działania](https://apps.yunohost.org/badge/state/mautrix_whatsapp)
![Status utrzymania](https://apps.yunohost.org/badge/maintained/mautrix_whatsapp)

[![Zainstaluj Matrix-WhatsApp bridge z YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mautrix_whatsapp)

*[Przeczytaj plik README w innym języku.](./ALL_README.md)*

> *Ta aplikacja pozwala na szybką i prostą instalację Matrix-WhatsApp bridge na serwerze YunoHost.*  
> *Jeżeli nie masz YunoHost zapoznaj się z [poradnikiem](https://yunohost.org/install) instalacji.*

## Przegląd

A puppeting bridge between Matrix and WhatsApp packaged as a YunoHost service.
Messages, media and notifications are bridged between a WhatsApp user and a matrix user.
With the RelayBot login option, the matrix user can invite other matrix user in a bridged WhatsApp room, such that even people without a WhatsApp account can participate to WhatsApp group conversations.
The ["Mautrix-WhatsApp"](https://docs.mau.fi/bridges/go/whatsapp/index.html) bridge consists in a synapse app service and relies on postgresql (mysql also available).
Therefore, [Synapse for YunoHost](https://github.com/YunoHost-Apps/synapse_ynh) should be installed beforehand.

** Attention: always backup and restore the Yunohost matrix_synapse et mautrix_whatsapp apps together!**


**Dostarczona wersja:** 0.11.3~ynh1
## Dokumentacja i zasoby

- Oficjalna strona aplikacji: <https://maunium.net/go/mautrix-whatsapp/>
- Oficjalna dokumentacja dla administratora: <https://docs.mau.fi/bridges/go/whatsapp/index.html>
- Repozytorium z kodem źródłowym: <https://github.com/mautrix/whatsapp>
- Sklep YunoHost: <https://apps.yunohost.org/app/mautrix_whatsapp>
- Zgłaszanie błędów: <https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/issues>

## Informacje od twórców

Wyślij swój pull request do [gałęzi `testing`](https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing).

Aby wypróbować gałąź `testing` postępuj zgodnie z instrukcjami:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing --debug
lub
sudo yunohost app upgrade mautrix_whatsapp -u https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing --debug
```

**Więcej informacji o tworzeniu paczek aplikacji:** <https://yunohost.org/packaging_apps>
