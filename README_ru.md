<!--
Важно: этот README был автоматически сгенерирован <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Он НЕ ДОЛЖЕН редактироваться вручную.
-->

# Matrix-WhatsApp bridge для YunoHost

[![Уровень интеграции](https://apps.yunohost.org/badge/integration/mautrix_whatsapp)](https://ci-apps.yunohost.org/ci/apps/mautrix_whatsapp/)
![Состояние работы](https://apps.yunohost.org/badge/state/mautrix_whatsapp)
![Состояние сопровождения](https://apps.yunohost.org/badge/maintained/mautrix_whatsapp)

[![Установите Matrix-WhatsApp bridge с YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mautrix_whatsapp)

*[Прочтите этот README на других языках.](./ALL_README.md)*

> *Этот пакет позволяет Вам установить Matrix-WhatsApp bridge быстро и просто на YunoHost-сервер.*  
> *Если у Вас нет YunoHost, пожалуйста, посмотрите [инструкцию](https://yunohost.org/install), чтобы узнать, как установить его.*

## Обзор

A puppeting bridge between Matrix and WhatsApp packaged as a YunoHost service.
Messages, media and notifications are bridged between a WhatsApp user and a matrix user.
With the RelayBot login option, the matrix user can invite other matrix user in a bridged WhatsApp room, such that even people without a WhatsApp account can participate to WhatsApp group conversations.
The ["Mautrix-WhatsApp"](https://docs.mau.fi/bridges/go/whatsapp/index.html) bridge consists in a synapse app service and relies on postgresql (mysql also available).
Therefore, [Synapse for YunoHost](https://github.com/YunoHost-Apps/synapse_ynh) should be installed beforehand.

** Attention: always backup and restore the Yunohost matrix_synapse et mautrix_whatsapp apps together!**


**Поставляемая версия:** 0.11.2~ynh1
## Документация и ресурсы

- Официальный веб-сайт приложения: <https://maunium.net/go/mautrix-whatsapp/>
- Официальная документация администратора: <https://docs.mau.fi/bridges/go/whatsapp/index.html>
- Репозиторий кода главной ветки приложения: <https://github.com/mautrix/whatsapp>
- Магазин YunoHost: <https://apps.yunohost.org/app/mautrix_whatsapp>
- Сообщите об ошибке: <https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/issues>

## Информация для разработчиков

Пришлите Ваш запрос на слияние в [ветку `testing`](https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing).

Чтобы попробовать ветку `testing`, пожалуйста, сделайте что-то вроде этого:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing --debug
или
sudo yunohost app upgrade mautrix_whatsapp -u https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing --debug
```

**Больше информации о пакетировании приложений:** <https://yunohost.org/packaging_apps>
