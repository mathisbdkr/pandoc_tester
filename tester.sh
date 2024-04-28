#!/bin/bash

PROGRAM="../mypandoc"
EXPECTED_OUTPUT_DIRS=("./expected_outputs/simple/syntaxe.json" "./expected_outputs/medium/syntaxe.json" "./expected_outputs/hard/syntaxe.json" "./expected_outputs/simple/syntaxe.md" "./expected_outputs/medium/syntaxe.md" "./expected_outputs/hard/syntaxe.md")
FILE_NAME="./log/test_log"
CURRENT_TIME=$(date "+%Y.%m.%d-%H.%M.%S")
TEMP_OUTPUT="temp_output"

declare -a ARG_1=(
    "-i ./test_file/json_file/test1.json -f json"
    "-i ./test_file/xml_file/test1.xml -f json"
    "-i ./test_file/json_file/test1.json -f json -e json"
    "-i ./test_file/xml_file/test1.xml -f json -e xml"

    "-i ./test_file/json_file/test1.json -e json -f json"
    "-i ./test_file/xml_file/test1.xml -e xml -f json"

    "-f json -i ./test_file/json_file/test1.json"
    "-f json -i ./test_file/xml_file/test1.xml"
    "-f json -e json -i ./test_file/json_file/test1.json"
    "-f json -e xml -i ./test_file/xml_file/test1.xml"

    "-e json -f json -i ./test_file/json_file/test1.json"
    "-e xml -f json -i ./test_file/xml_file/test1.xml"
)

declare -a ARG_2=(
    "-i ./test_file/json_file/test3.json -f json"
    "-i ./test_file/xml_file/test3.xml -f json"
    "-i ./test_file/json_file/test3.json -f json -e json"
    "-i ./test_file/xml_file/test3.xml -f json -e xml"

    "-i ./test_file/json_file/test3.json -e json -f json"
    "-i ./test_file/xml_file/test3.xml -e xml -f json"

    "-f json -i ./test_file/json_file/test3.json"
    "-f json -i ./test_file/xml_file/test3.xml"
    "-f json -e json -i ./test_file/json_file/test3.json"
    "-f json -e xml -i ./test_file/xml_file/test3.xml"

    "-e json -f json -i ./test_file/json_file/test3.json"
    "-e xml -f json -i ./test_file/xml_file/test3.xml"
)

declare -a ARG_3=(
    "-i ./test_file/json_file/test2.json -f json"
    "-i ./test_file/xml_file/test2.xml -f json"
    "-i ./test_file/json_file/test2.json -f json -e json"
    "-i ./test_file/xml_file/test2.xml -f json -e xml"

    "-i ./test_file/json_file/test2.json -e json -f json"
    "-i ./test_file/xml_file/test2.xml -e xml -f json"

    "-f json -i ./test_file/json_file/test2.json"
    "-f json -i ./test_file/xml_file/test2.xml"
    "-f json -e json -i ./test_file/json_file/test2.json"
    "-f json -e xml -i ./test_file/xml_file/test2.xml"

    "-e json -f json -i ./test_file/json_file/test2.json"
    "-e xml -f json -i ./test_file/xml_file/test2.xml"
)

declare -a ARG_4=(
    "-i ./test_file/json_file/test1.json -f markdown"
    "-i ./test_file/xml_file/test1.xml -f markdown"
    "-i ./test_file/json_file/test1.json -f markdown -e json"
    "-i ./test_file/xml_file/test1.xml -f markdown -e xml"

    "-i ./test_file/json_file/test1.json -e json -f markdown"
    "-i ./test_file/xml_file/test1.xml -e xml -f markdown"

    "-f markdown -i ./test_file/json_file/test1.json"
    "-f markdown -i ./test_file/xml_file/test1.xml"
    "-f markdown -e json -i ./test_file/json_file/test1.json"
    "-f markdown -e xml -i ./test_file/xml_file/test1.xml"

    "-e json -f markdown -i ./test_file/json_file/test1.json"
    "-e xml -f markdown -i ./test_file/xml_file/test1.xml"
)

declare -a ARG_5=(
    "-i ./test_file/json_file/test3.json -f markdown"
    "-i ./test_file/xml_file/test3.xml -f markdown"
    "-i ./test_file/json_file/test3.json -f markdown -e json"
    "-i ./test_file/xml_file/test3.xml -f markdown -e xml"

    "-i ./test_file/json_file/test3.json -e json -f markdown"
    "-i ./test_file/xml_file/test3.xml -e xml -f markdown"

    "-f markdown -i ./test_file/json_file/test3.json"
    "-f markdown -i ./test_file/xml_file/test3.xml"
    "-f markdown -e json -i ./test_file/json_file/test3.json"
    "-f markdown -e xml -i ./test_file/xml_file/test3.xml"

    "-e json -f markdown -i ./test_file/json_file/test3.json"
    "-e xml -f markdown -i ./test_file/xml_file/test3.xml"
)

declare -a ARG_6=(
    "-i ./test_file/json_file/test2.json -f markdown"
    "-i ./test_file/xml_file/test2.xml -f markdown"
    "-i ./test_file/json_file/test2.json -f markdown -e json"
    "-i ./test_file/xml_file/test2.xml -f markdown -e xml"

    "-i ./test_file/json_file/test2.json -e json -f markdown"
    "-i ./test_file/xml_file/test2.xml -e xml -f markdown"

    "-f markdown -i ./test_file/json_file/test2.json"
    "-f markdown -i ./test_file/xml_file/test2.xml"
    "-f markdown -e json -i ./test_file/json_file/test2.json"
    "-f markdown -e xml -i ./test_file/xml_file/test2.xml"

    "-e json -f markdown -i ./test_file/json_file/test2.json"
    "-e xml -f markdown -i ./test_file/xml_file/test2.xml"
)

declare -a ALL_ARGS=("${ARG_1[@]}" "${ARG_2[@]}" "${ARG_3[@]}" "${ARG_4[@]}" "${ARG_5[@]}" "${ARG_6[@]}")
declare -a OUTPUT_GROUPS=("${EXPECTED_OUTPUT_DIRS[0]}" "${EXPECTED_OUTPUT_DIRS[1]}" "${EXPECTED_OUTPUT_DIRS[2]}" "${EXPECTED_OUTPUT_DIRS[3]}" "${EXPECTED_OUTPUT_DIRS[4]}" "${EXPECTED_OUTPUT_DIRS[5]}")
declare -a TEST_TITLE=("Easy test to JSON" "Medium test to JSON" "Hard test to JSON" "Easy test to Markdown" "Medium test to Markdown" "Hard test to Markdown")

TEST_NUMBER=1
GROUP_NUMBER=0
TOTAL_TESTS=${#ALL_ARGS[@]}
TOTAL_GROUPS=${#TEST_TITLE[@]}

echo -e "log of the test of $PROGRAM\n\n" > $FILE_NAME

ARG1_LENGTH=${#ARG_1[@]}

echo -e "${TEST_TITLE[0]}\n"

for CMD in "${ALL_ARGS[@]}"; do
    EXPECTED_OUTPUT="${OUTPUT_GROUPS[GROUP_NUMBER]}"

    echo -e "${TEST_TITLE[GROUP_NUMBER]} $TEST_NUMBER\n" >> $FILE_NAME
    echo "$PROGRAM $CMD" &>> $FILE_NAME
    $PROGRAM $CMD &> $TEMP_OUTPUT
    cat $TEMP_OUTPUT >> $FILE_NAME
    DIFF_RESULT=$(diff $TEMP_OUTPUT $EXPECTED_OUTPUT)
    
    if [ -z "$DIFF_RESULT" ]; then
        echo -e "${TEST_TITLE[GROUP_NUMBER]} $TEST_NUMBER \t : \033[42m\033[30m[✔]\033[0m\t: $PROGRAM $CMD"
    else
        echo -e "${TEST_TITLE[GROUP_NUMBER]} $TEST_NUMBER \t : \033[41m[✘]\033[0m\t: $PROGRAM $CMD"
    fi
    echo -e "@\n\n" >> $FILE_NAME
    TEST_NUMBER=$((TEST_NUMBER + 1))
    
    if [[ $TEST_NUMBER -gt $ARG1_LENGTH ]]; then
        if [ $((GROUP_NUMBER + 1)) -lt $TOTAL_GROUPS ]; then
            echo -e "\n\n${TEST_TITLE[GROUP_NUMBER + 1]}\n"
            echo -e "\n\n${TEST_TITLE[GROUP_NUMBER + 1]}\n" >> $FILE_NAME 
        fi
        TEST_NUMBER=1
        GROUP_NUMBER=$((GROUP_NUMBER + 1))
    fi

done

rm $TEMP_OUTPUT

NEW_FILENAME=$FILE_NAME"("$CURRENT_TIME")".log
mv $FILE_NAME $NEW_FILENAME
