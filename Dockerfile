FROM thrashr888/sentinel-simulator

LABEL "com.github.actions.name"="sentinel test"
LABEL "com.github.actions.description"="Test Sentinel policies"
LABEL "com.github.actions.icon"="terminal"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="https://github.com/rberlind/sentinel-policy-sets-for-tfc"
LABEL "homepage"="http://github.com/rberlind/sentinel-policy-sets-for-tfc"
LABEL "maintainer"="Roger Berlind"

RUN apk --no-cache add jq curl

COPY entrypoint.sh /entrypoint.sh
COPY sentinel-policy-sets /github/workspace/sentinel-policy-sets
ENTRYPOINT ["/entrypoint.sh"]
CMD ["."]
