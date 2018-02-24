#!/bin/bash

###################################
## DeployTasks
## v 0.4.0
## By @Darklg
## License MIT
###################################

# Please copy this file and make it your own

# Relative path from this file to the DeployTasks folder
DEPLOYTASKS__DEPLOY_RELATIVE_DIR='';

# Relative path from this file to the root of your project
DEPLOYTASKS__DEPLOY_RELATIVE_PROJECT_DIR='../';

# Maintenance flag name.
DEPLOYTASKS__MAINTENANCE_FLAG_NAME='maintenance.flag';

###################################
## INIT BASE VARS
###################################

DEPLOYTASKS__BASE_DIR="$( cd $(dirname "${BASH_SOURCE[0]}") && pwd )/";
DEPLOYTASKS__DEPLOY_DIR="${DEPLOYTASKS__BASE_DIR}/${DEPLOYTASKS__DEPLOY_RELATIVE_DIR}";
DEPLOYTASKS__PROJECT_DIR="${DEPLOYTASKS__BASE_DIR}/${DEPLOYTASKS__DEPLOY_RELATIVE_PROJECT_DIR}";
DEPLOYTASKS__CURRENT_BRANCH=$(git branch | grep \* | cut -d ' ' -f2);
DEPLOYTASKS__CONTROL_FILE="${DEPLOYTASKS__BASE_DIR}deploy-running.txt";

###################################
## ADD YOUR TASKS HERE
###################################

# Avoid double launch
if [ -f "${DEPLOYTASKS__CONTROL_FILE}" ]; then
    echo '- A deploy is already running.';
    return 0;
fi;
touch "${DEPLOYTASKS__CONTROL_FILE}";

# Check if new commits are available
. "${DEPLOYTASKS__DEPLOY_DIR}/shell-tasks/git-check.sh";

# Set maintenance mode
. "${DEPLOYTASKS__DEPLOY_DIR}/shell-tasks/set-maintenance.sh";

# Pull from origin
. "${DEPLOYTASKS__DEPLOY_DIR}/shell-tasks/git-pull.sh";

# Empty WordPress cache
# php "${DEPLOYTASKS__DEPLOY_DIR}/shell-tasks/wordpress-cache.php";

# Flush Redis Cache
# . "${DEPLOYTASKS__DEPLOY_DIR}/shell-tasks/flush-redis.sh";

# Set maintenance mode
. "${DEPLOYTASKS__DEPLOY_DIR}/shell-tasks/unset-maintenance.sh";

# Allow new deploy
rm "${DEPLOYTASKS__CONTROL_FILE}";
