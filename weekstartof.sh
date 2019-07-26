#!/bin/bash

# 指定された西暦・週番号の週が開始するUNIX時刻を返す
# $1 週番号
# $2 西暦
#
# 参考URLのスクリプトを目的に合わせて修正した
# see => https://stackoverflow.com/a/15606900
function week_start_of()
{
    local week=$1 year=$2
    local week_num_of_Jan_1 week_day_of_Jan_1
    local first_Mon
    local date_fmt="+%s"
    local week_start

    week_num_of_Jan_1=$(date -d $year-01-01 +%W)
    week_day_of_Jan_1=$(date -d $year-01-01 +%u)

    if ((week_num_of_Jan_1)); then
        first_Mon=$year-01-01
    else
        first_Mon=$year-01-$((01 + (7 - week_day_of_Jan_1 + 1) ))
    fi

    week_start=$(date -d "$first_Mon +$((week - 1)) week" "$date_fmt")
    echo $week_start
}

week_start_of $1 $2

