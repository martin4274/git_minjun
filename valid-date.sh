#!/bin/bash

# 유효한 월 목록
months=("Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov" "Dec")
months_long=("January" "February" "March" "April" "May" "June" "July" "August" "September" "October" "November" "December")

# 월 이름을 정규화하는 함수
normalize_month() {
    local month="$1"
    case "$month" in
        1 | jan | january) echo "Jan" ;;
        2 | feb | february) echo "Feb" ;;
        3 | mar | march) echo "Mar" ;;
        4 | apr | april) echo "Apr" ;;
        5 | may) echo "May" ;;
        6 | jun | june) echo "Jun" ;;
        7 | jul | july) echo "Jul" ;;
        8 | aug | august) echo "Aug" ;;
        9 | sep | september) echo "Sep" ;;
        10 | oct | october) echo "Oct" ;;
        11 | nov | november) echo "Nov" ;;
        12 | dec | december) echo "Dec" ;;
        *) echo "Invalid" ;;
    esac
}

# 윤년 판별 함수
is_leap_year() {
    local year="$1"
    if (( year % 4 != 0 )); then
        return 1
    elif (( year % 400 == 0 )); then
        return 0
    elif (( year % 100 == 0 )); then
        return 1
    else
        return 0
    fi
}

# 인수가 3개인지 확인
if [ "$#" -ne 3 ]; then
    echo "입력값 오류"
    exit 1
fi

# 입력값 변수에 할당
input_month=$(normalize_month "$1")
day="$2"
year="$3"

# 월 변환 확인
if [ "$input_month" = "Invalid" ]; then
    echo "유효하지 않은 월: $1"
    exit 1
fi

# 날짜 숫자형 확인
if ! [[ "$day" =~ ^[0-9]+$ ]]; then
    echo "유효하지 않은 날짜: $day"
    exit 1
fi

if ! [[ "$year" =~ ^[0-9]+$ ]]; then
    echo "유효하지 않은 년도: $year"
    exit 1
fi

# 각 달의 일수 설정
declare -A days_in_month
days_in_month=( ["Jan"]=31 ["Feb"]=28 ["Mar"]=31 ["Apr"]=30 ["May"]=31 ["Jun"]=30 ["Jul"]=31 ["Aug"]=31 ["Sep"]=30 ["Oct"]=31 ["Nov"]=30 ["Dec"]=31 )

# 윤년일 경우 2월의 일수 수정
if is_leap_year "$year"; then
    days_in_month["Feb"]=29
fi

# 유효한 날짜인지 확인
if (( day < 1 || day > ${days_in_month[$input_month]} )); then
    echo "유효하지 않은 일자: $day"
    exit 1
fi

# 결과 출력
echo "$input_month $day $year"
exit 0
