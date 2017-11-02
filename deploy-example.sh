#!/bin/bash

###################################
## DeployTasks
## v 0.2.0
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

DEPLOYTASKS__BASE_DIR="$( dirname "${BASH_SOURCE[0]}" )/";
DEPLOYTASKS__DEPLOY_DIR="${DEPLOYTASKS__BASE_DIR}/${DEPLOYTASKS__DEPLOY_RELATIVE_DIR}";
DEPLOYTASKS__PROJECT_DIR="${DEPLOYTASKS__BASE_DIR}/${DEPLOYTASKS__DEPLOY_RELATIVE_PROJECT_DIR}";
DEPLOYTASKS__CURRENT_BRANCH=$(git branch | grep \* | cut -d ' ' -f2);

###################################
## ADD YOUR TASKS HERE
###################################

# Check if new commits are available
. "${DEPLOYTASKS__DEPLOY_DIR}/shell-tasks/git-check.sh";

# Set maintenance mode
. "${DEPLOYTASKS__DEPLOY_DIR}/shell-tasks/set-maintenance.sh";

# Pull from origin
. "${DEPLOYTASKS__DEPLOY_DIR}/shell-tasks/git-pull.sh";

# Set maintenance mode
. "${DEPLOYTASKS__DEPLOY_DIR}/shell-tasks/unset-maintenance.sh";
