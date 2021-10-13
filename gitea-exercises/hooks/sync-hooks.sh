#!/usr/bin/env bash

# re-distribute the pre and post receive hook to all existing repositories in gitea
# all newly created repositories will automatically use the updated versions

# assumes hooks are named "laurel" when mounted into gitea

# note that gitea does NOT need to be restarted or anything for the changes in hook scripts to take effect

# execute by running docker-compose exec --user <GITEA_USER> -i <GITEA_CONTAINER_NAME> bash < sync-hooks.sh
# e.g: docker exec --user git -i laurel-gitea-exercises bash < hooks/sync-hooks.sh

for repo in "$HOME"/repositories/*/*; do
  cp "/usr/share/git-core/templates/hooks/pre-receive.d/laurel" "$repo/hooks/pre-receive.d/laurel"
  cp "/usr/share/git-core/templates/hooks/post-receive.d/laurel" "$repo/hooks/post-receive.d/laurel"
done
