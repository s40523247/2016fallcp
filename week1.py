# 設定 /etc/init/brython-server.conf
# 設定 /etc/nginx/sites-available/default
# redis 自動啟動
# 只要在 8888 虛擬機器加入 IPV4 的設定
# 還有讓 8888 納入 IPV4 DNS 設定
# 就可以正常與 Github API 主機透過 IPV4 交換 token 了
# 讓協同者也可以修改, 並且提交推送
# 使用井字號開頭的這一行, 為註解, Python 解譯器不會執行
'''
以3個單引號, 或3個雙引號前後圈住的內容, 為多行註解, Python 解譯器也不會執行
https://blog.openshift.com/enabling-redis-for-your-app/
'''
# 選擇一個變數, 名稱定為 repeat, 且將整數 10 與此變數對應
repeat = 10
for i in range(repeat):
    print("hello world!")
