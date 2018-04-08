import os
import requests

state = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado','Connecticut','Delaware','Florida','Georgia','Hawaii','Idaho','Illinois','Indiana','Iowa','Kansas','Kentucky','Louisiana','Maine','Maryland','Massachusetts','Michigan','Minnesota','Mississippi','Missouri','Montana','Nebraska','Nevada','New Hampshire','New Jersey','New Mexico','New York','North Carolina','North Dakota','Ohio','Oklahoma','Oregon','Pennsylvania','Rhode Island','South Carolina','South Dakota','Tennessee','Texas','Utah','Vermont','Virginia','Washington','West Virginia','Wisconsin','Wyoming']
path = os.getcwd()
curPath = path + '\county_pop_by_state\\'
for i in range(56):
    try:
        ten = (i + 1) / 10
        one = (i + 1) % 10
        url = "https://www2.census.gov/geo/docs/reference/cenpop2010/county/CenPop2010_Mean_CO{0}{1}.txt".format(ten, one)
        headers = {
            'upgrade-insecure-requests': "1",
            'user-agent': "Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36",
            'accept': "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8",
            'accept-encoding': "gzip, deflate, br",
            'accept-language': "en-US,en;q=0.9,zh-CN;q=0.8,zh;q=0.7",
            'cookie': "s_fid=21F3B3727B2FEDA7-368FDF9297C602A9; s_cc=true; _ga=GA1.3.913816518.1518187105; _gid=GA1.3.128515338.1518187105; undefined_s=First%20Visit; s_vnum=1523371104989%26vn%3D3; s_invisit=true; _ga=GA1.2.16813219.1518240482; _gid=GA1.2.1217219818.1518240482; s_sq=cebucensusglobalprod%3D%2526c.%2526a.%2526activitymap.%2526page%253DCenters%252520of%252520Population%252520-%252520Geography%252520-%252520U.S.%252520Census%252520Bureau%2526link%253DGO%2526region%253Dmiddle-column%2526pageIDType%253D1%2526.activitymap%2526.a%2526.c%2526pid%253DCenters%252520of%252520Population%252520-%252520Geography%252520-%252520U.S.%252520Census%252520Bureau%2526pidt%253D1%2526oid%253D%252520GO%252520%2526oidt%253D3%2526ot%253DSUBMIT; s_gnr=1518246305642-Repeat",
            'cache-control': "no-cache",
            'postman-token': "d14e29b9-f923-598e-4e75-718f2a135e36"
        }
        response = requests.request("GET", url, headers=headers)
        content = response.text
        file = open(curPath + str(i + 1) +'.txt', 'w')
        print content
        file.write(content)
        file.close()
        print i
    except:
        pass





