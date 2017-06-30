#!/bin/bash

cd "${DEPLOYTASKS__PROJECT_DIR}";

echo '########################################';
echo "TEST origin/${DEPLOYTASKS__CURRENT_BRANCH}";
echo '########################################';

git fetch;
DEPLOYTASKS__NB_COMMITS_DIFFS=$(git rev-list HEAD...origin/${DEPLOYTASKS__CURRENT_BRANCH} --count);
if [[ ${DEPLOYTASKS__NB_COMMITS_DIFFS} == '0' ]];then
    echo "- NO NEW COMMITS ON origin/${DEPLOYTASKS__CURRENT_BRANCH}";
    echo "- DEPLOY IS STOPPED.";
    exit 0;
else
    echo "- NEW COMMITS FOUND !";
fi;
