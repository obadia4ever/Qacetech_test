## Rolling Back a Release

### Via Helm
```bash
# See revision history
helm history cats-app

# Rollback to previous release
helm rollback cats-app <REVISION_NUMBER>
```