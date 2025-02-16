<!--
N.B.: README ini dibuat secara otomatis oleh <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Ini TIDAK boleh diedit dengan tangan.
-->

# Matrix-WhatsApp bridge untuk YunoHost

[![Tingkat integrasi](https://apps.yunohost.org/badge/integration/mautrix_whatsapp)](https://ci-apps.yunohost.org/ci/apps/mautrix_whatsapp/)
![Status kerja](https://apps.yunohost.org/badge/state/mautrix_whatsapp)
![Status pemeliharaan](https://apps.yunohost.org/badge/maintained/mautrix_whatsapp)

[![Pasang Matrix-WhatsApp bridge dengan YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mautrix_whatsapp)

*[Baca README ini dengan bahasa yang lain.](./ALL_README.md)*

> *Paket ini memperbolehkan Anda untuk memasang Matrix-WhatsApp bridge secara cepat dan mudah pada server YunoHost.*  
> *Bila Anda tidak mempunyai YunoHost, silakan berkonsultasi dengan [panduan](https://yunohost.org/install) untuk mempelajari bagaimana untuk memasangnya.*

## Ringkasan

A puppeting bridge between Matrix and WhatsApp packaged as a YunoHost service.
Messages, media and notifications are bridged between a WhatsApp user and a matrix user.
With the RelayBot login option, the matrix user can invite other matrix user in a bridged WhatsApp room, such that even people without a WhatsApp account can participate to WhatsApp group conversations.
The ["Mautrix-WhatsApp"](https://docs.mau.fi/bridges/go/whatsapp/index.html) bridge consists in a synapse app service and relies on postgresql (mysql also available).
Therefore, [Synapse for YunoHost](https://github.com/YunoHost-Apps/synapse_ynh) should be installed beforehand.

** Attention: always backup and restore the Yunohost matrix_synapse et mautrix_whatsapp apps together!**


**Versi terkirim:** 0.11.3~ynh1
## Dokumentasi dan sumber daya

- Website aplikasi resmi: <https://maunium.net/go/mautrix-whatsapp/>
- Dokumentasi admin resmi: <https://docs.mau.fi/bridges/go/whatsapp/index.html>
- Depot kode aplikasi hulu: <https://github.com/mautrix/whatsapp>
- Gudang YunoHost: <https://apps.yunohost.org/app/mautrix_whatsapp>
- Laporkan bug: <https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/issues>

## Info developer

Silakan kirim pull request ke [`testing` branch](https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing).

Untuk mencoba branch `testing`, silakan dilanjutkan seperti:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing --debug
atau
sudo yunohost app upgrade mautrix_whatsapp -u https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing --debug
```

**Info lebih lanjut mengenai pemaketan aplikasi:** <https://yunohost.org/packaging_apps>
