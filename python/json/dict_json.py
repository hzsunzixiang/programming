

# split url
#'{"act_listid=320001130120180703020000000030&is_reissue=0&openid=o5PXlsqwUgWKfNXpvnpEUOhklrUM&send_type=4&spid=3200011301&spidpay_listid=320001130120180703114506000003o5PXlsqwUgWKfNXpvnpEUOhklrUM&sign=a95c3bc0877262563d8fd88da0f3a833bb2f284f}'

url = "http://www.example.org/default.html?ct=32&op=92&item=98"
url = "http://hb.moneydata.hk/cgi-bin/ia_wcerp_rpsend_req.cgi?act_listid=320001130120180703020000000030&is_reissue=0&openid=o5PXlsqwUgWKfNXpvnpEUOhklrUM&pass_ticket=CvuNnF8pnt%2BoEFO8afoBupXgRHCC9WLgvLqyPBnWuqw%2F3FTP%2FWmgGfaYdNeg%2B1oN&send_type=4&spid=3200011301&spidpay_listid=320001130120180703114506000003o5PXlsqwUgWKfNXpvnpEUOhklrUM&sign=a95c3bc0877262563d8fd88da0f3a833bb2f284f"


# transfer url to dict
from urlparse import urlparse, parse_qsl

parse_url = urlparse(url)

query_dict = dict(parse_qsl(parse_url.query))

print query_dict
# to json


import json

r = json.dumps(query_dict)
print r
#type(r) #Output str




