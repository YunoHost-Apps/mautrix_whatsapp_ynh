## Development code quality
Le script `.github/workflows/updater.sh` doit être synchronisé avec les changements dans `conf/config.yaml`,
donc un hook `pre-commit` est utilisé pour afficher un rappel pour mettre à jour
`.github/workflows/updater.sh` (si nécessaire) lorsque `conf/config.yaml` a été modifié.

Veuillez activer les hooks Git en utilisant la commande suivante pour assurer la qualité et la stabilité du code.
``` bash
git config --local core.hooksPath .githooks
```