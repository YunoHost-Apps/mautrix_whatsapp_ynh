## Development code quality

The `.github/workflows/updater.sh` script needs to be synced with changes in `conf/config.yaml` therefore a `pre-commit`
hook is used to display a reminder to update `.github/workflows/updater.sh` (if needed)  when `conf/config.yaml` has been modified.

Please enable Git hooks using following command to ensure code quality and stability.
``` bash
git config --local core.hooksPath .githooks
```