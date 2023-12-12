## Buenas prácticas de desarrollo
El script `.github/workflows/updater.sh` necesita estar acorde con los cambios en `conf/config.yaml` por lo que se utiliza un hook `pre-commit`
que se utiliza para mostrar un recordatorio para actualizar `.github/workflows/updater.sh` (si es necesario) cuando `conf/config.yaml` ha sido modificado.

Por favor, es importante activar los hooks Git usando el siguiente comando para asegurar la calidad y estabilidad del código.
``` bash
git config --local core.hooksPath .githooks
```