# standard format date - example: Apr 22 23:59:56
DATE_REGEX_='([A-Z][a-z]{2}\s+[0-9]{1,2}\s+[0-9]{2}:[0-9]{2}:[0-9]{2})\s+'

# machine,type,ip,ip - example: machine1 nginx-myapp-access: 123.12.123.12 10.10.10.10
MTII_='([a-z.0-9]+)\s+([-a-z.0-9]+:)\s+([0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}\s[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3})\s+'

# date in UTC format - example: [22/Apr/2016:23:59:52 +0200]
DATE_UTC_='([^"]+)\s+'

# access type:  example: "GET
METHOD_='"([A-Z]+)\s+'

# accessed path
ACCESS_PATH_='([^ ]+)\s+'

# http version 
HTTP_VER_='HTTP[/0-9."]+\s+'

# status code
STATUS_CODE_='([0-9]{3})\s+'

# some number 
SOME_NUMBERS_='[0-9]+\s+'

# referrer url 
REFERRER_URL_='"([^"]+)"\s+'

# user agent 
USER_AGENT_='"([^"]+)"\s+'

# domain 
DOMAIN_='"([^"]+)"\s*'

ANYTHING_='.*'

### formating parts:
# \1 date -- 'Apr 22 23:59:56'
# \2 machine -- 'machine1'
# \3 logtype -- 'nginx-myapp-access:'
# \4 machine ip -- '123.12.123.12 10.10.10.10'
# \5 utc time -- '- - [22/Apr/2016:23:59:52 +0200]'
# \6 method -- GET
# \7 access path 
# \8 status code 
# \9 referrer url 
# \10 user agent 
# \11 domain


## Examples:
# this will print lines containing only path and referrer, can be called as ./parseNginxLog.sh access_log.log > outputFile
sed -rn 's/'"$DATE_REGEX_$MTII_$DATE_UTC_$METHOD_$ACCESS_PATH_$HTTP_VER_$STATUS_CODE_$SOME_NUMBERS_$REFERRER_URL_$USER_AGENT_$DOMAIN_"'/\7 \9/p' $1
