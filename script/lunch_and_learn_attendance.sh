#/usr/bin/env bash

ruby -ryaml -rjson -e 'puts JSON.pretty_generate(YAML.load(ARGF))' \
  | jq "def flatten: reduce .[] as \$i ([]; if \$i | type == \"array\" then . + (\$i | flatten) else . + [\$i] end); [.[].attendance]|flatten|unique"
