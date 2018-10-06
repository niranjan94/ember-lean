#!/usr/bin/env bash

export REMOVE_COMMAND="npm uninstall --save"
export ADD_COMMAND="npm install --save --dev"

if [ -e "yarn.lock" ]; then
    export REMOVE_COMMAND="yarn remove"
    export ADD_COMMAND="yarn add"
fi

${REMOVE_COMMAND} ember-data ember-welcome-page @ember/jquery ember-ajax
ember install ember-decorators
ember install @ember-decorators/argument

echo "{{outlet}}" > app/templates/application.hbs
rm -rf dist tmp app/models
ember build -prod