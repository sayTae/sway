
#!/bin/bash

# 현재 날짜와 시간 가져오기
current_year=$(date +%Y)
current_month=$(date +%-m)
current_day=$(date +%-d)
current_time=$(date +%H:%M)

# 달력 생성
calendar=$(cal | sed 's/^/    /')

# 레이와 시대 시작: 2019년 5월 1일
# 헤이세이 시대 시작: 1989년 1월 8일
if [ $current_year -ge 2019 ]; then
    era="令和"
    jp_year=$((current_year - 2018))
elif [ $current_year -ge 1989 ]; then
    era="平成"
    jp_year=$((current_year - 1988))
else
    era="昭和"
    jp_year=$((current_year - 1925))
fi

# JSON 형식으로 출력 (달력 포함)
echo "{\"text\": \"${era}${jp_year}年${current_month}月${current_day}日 ${current_time}\", \"tooltip\": \"<big>${current_year}年 ${current_month}月</big>\\n<tt><small>${calendar}</small></tt>\"}"
