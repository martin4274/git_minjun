#!/bin/bash

declare -A region_codes=(
    ["02"]="서울"
    ["031"]="경기"
    ["032"]="인천"
    ["051"]="부산"
    ["053"]="대구"
)

phonebook_file="phonebook.txt"

is_valid_phone_number() {
    local phone_number="$1"
    [[ "$phone_number" =~ ^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$ ]]
}

get_region() {
    local phone_number="$1"
    for code in "${!region_codes[@]}"; do
        if [[ "$phone_number" == "$code"* ]]; then
            echo "${region_codes[$code]}"
            return
        fi
    done
    echo "알 수 없음"
}

read_phonebook() {
    if [[ -f "$phonebook_file" ]]; then
        cat "$phonebook_file"
    fi
}

write_phonebook() {
    sort > "$phonebook_file"
}

main() {
    if [[ "$#" -ne 2 ]]; then
        echo "사용법: $0 이름 전화번호"
        exit 1
    fi

    local name="$1"
    local phone_number="$2"

    if ! is_valid_phone_number "$phone_number"; then
        echo "잘못된 전화번호 형식입니다. 전화번호는 하이픈(-)으로 연결된 숫자여야 합니다."
        exit 2
    fi

    local phonebook=$(read_phonebook)
    local updated_phonebook=""
    local entry_found=false

    while IFS= read -r entry; do
        local entry_name=$(echo "$entry" | awk '{print $1}')
        local entry_phone=$(echo "$entry" | awk '{print $2}')

        if [[ "$entry_name" == "$name" ]]; then
            entry_found=true
            if [[ "$entry_phone" == "$phone_number" ]]; then
                echo "동일한 전화번호가 이미 존재합니다."
                exit 0
            else
                echo "$name의 전화번호를 업데이트합니다."
                entry_phone="$phone_number"
            fi
        fi
        updated_phonebook+="$entry_name $entry_phone $(get_region "$entry_phone")"$'\n'
    done <<< "$phonebook"

    if [[ "$entry_found" == false ]]; then
        updated_phonebook+="$name $phone_number $(get_region "$phone_number")"$'\n'
    fi

    echo -e "$updated_phonebook" | write_phonebook
    echo "$name의 전화번호를 $phone_number로 추가하였습니다. 지역: $(get_region "$phone_number")"
}

main "$@"
