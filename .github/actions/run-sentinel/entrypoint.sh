#!/bin/sh

set -e
cd "$1"

set +e
OUTPUT=$(sh -c "sentinel test -verbose" 2>&1)
SUCCESS=$?
echo "$OUTPUT"
set -e

if [ $SUCCESS -eq 0 ]; then
    exit 0
fi

if [ "$STL_ACTION_COMMENT" = "1" ] || [ "$STL_ACTION_COMMENT" = "false" ]; then
    exit $SUCCESS
fi

FMT_TEST=$(echo "$OUTPUT" | sed -e "s,$(printf '\033')\\[[0-9;]*[a-zA-Z],,g")
COMMENT="#### \`sentinel test\` Failed
\`\`\`
$FMT_TEST
\`\`\`"
PAYLOAD=$(echo '{}' | jq --arg body "$COMMENT" '.body = $body')
COMMENTS_URL=$(cat /github/workflow/event.json | jq -r .pull_request.comments_url)
curl -s -S -H "Authorization: token $GITHUB_TOKEN" --header "Content-Type: application/json" --data "$PAYLOAD" "$COMMENTS_URL" > /dev/null

exit $SUCCESS
