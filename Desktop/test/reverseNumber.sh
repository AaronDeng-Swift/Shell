#! /bin/bash

# 主题: 整数反转

#============== 参数 ==============
userInput=$1                     #
isSimpleNumber="false"           #
isMinusNumber="false"            #
isNumber="true"   				 # 
outputValue="" 					 #
swapParameterData_Output="" 	 #
# tryTimes=(1 2 3) 				 #
#============== 参数 ==============


# 判读输入的是否为数字
function checkPoint_I {
	local parameterData=$1
	local lineNumber=`echo "${parameterData}" | tr -c "[0-9]-" "\n" | wc -l`
	[[ ${lineNumber} -ne 1 ]] && isNumber="false"
}

# 对输入的信息的内容进行交换
function splitNumber_I_O {
	local parameterData=$1
	test ${parameterData} -lt 0 && isMinusNumber="true" && parameterData=$((0-${parameterData}))    # 判断是否为负数
	local parameterNumber=`echo -n ${parameterData} | wc -c`
	[[ ${parameterNumber} -eq 1 ]] && isSimpleNumber="true" && return 1
	local parameterNumberPlusOne=$((parameterNumber+1))

	for number in `seq ${parameterNumber}`
	do
		swapParameterData_Output+="`echo ${parameterData} | cut -c $((${parameterNumberPlusOne}-${number}))`"
	done
	# echo "${swapParameterData_Output}"
}

# 对输出的结果进行判断
function gudgeOutput_I_O {
	local parameterData=$1

	# 判断是否是单位数字
	test ${isSimpleNumber} == "true" && outputValue="${userInput}-" && return 2

	# 判断是否为镜像数字
	test ${userInput} == ${swapParameterData_Output} && outputValue="${userInput}^" && return 3

	# 判断是否为负数
	# test ${userInput} -lt 0 && isMinusNumber="true"

	# 给定输出
	if [[ ${isMinusNumber} == "true" ]]; then
		outputValue="-${swapParameterData_Output}"
	else
		outputValue=`echo "${swapParameterData_Output} / 1" | bc`	# 可以将 001 转成 1
	fi
}


# 开始函数
main_Start() {

	# 判读是否有输入:
	# for time in ${tryTimes[@]}
	# do
	# 	[[ ${userInput} == "" ]] && echo "Input number: " ; read userInput && continue
	# 	break
	# done
	while [[ 1 ]]; do
		isNumber="true"
		[[ ${userInput} == "" ]] && echo -e -n "Input number\033[5m:\033[25m " && read userInput # && continue
		[[ ${userInput} == [qQ] ]] && return 0
		[[ ${userInput} == "" ]] && continue
		checkPoint_I ${userInput}
		if test ${isNumber} == "false" ; then
			userInput=""
			echo -e "\033[31mPlease alway input number.\033[0m"
			continue
		else
			break
		fi
	done


	splitNumber_I_O ${userInput}

	gudgeOutput_I_O ${swapParameterData_Output}

	echo "Change result: ${outputValue}"
}

main_Start







































# passParseString="good"
# actionItem="nil"

# PASSSTATUSFUNC="while read line; do echo ${line}; PASSSTATUS=`echo ${line} | grep ${passParseString}`; if [[ ${PASSSTATUS} != "" ]]; then actionItem=""; fi ;  done"

# echo -e "good\nhaha\ngood" | while read line; do
# 				echo ${line}; 
# 				PASSSTATUS=`echo ${line} | grep ${passParseString}`; 
# 				if [[ ${PASSSTATUS} != "" ]]; then 
# 					actionItem="nice"; 
# 				fi ;  
# 				actionItem="nice"
# 			done
# echo ${actionItem}

# ignoreSNCheckKey="C02[0-9]"

# if [[ $1 == ${ignoreSNCheckKey} ]]; then
# 	echo $1
# fi

# function a() {
# 	echo good
# 	return -3
# }
# a
# status=$?
# if [[ ${status} -eq 1 ]]; then
# 	echo a
# else
# 	echo ${status}
# fi

# basename $0
# osascript -e 'tell application "Terminal"
# 	tell application "System Events" to tell process "Terminal" to keystroke "n" using command down
# 	tell application "Terminal" to do script "echo good; echo nice" in selected tab of the front window
# end tell' | while read line; do
# 	echo "[`date +%F` `date +%H:%M:%S`] ${line}"
# done

# userInput=$1
# function returnValue() {
# 	if [[ $1 == "" ]]; then
# 		return 0
# 	elif [[ $1 -eq 1 ]]; then
# 		return 1
# 	elif [[ $1 -eq 2 ]]; then
# 		return 2
# 	elif [[ $1 -eq 3 ]]; then
# 		return 3
# 	else
# 		return -1
# 	fi
# }

# returnValue ${userInput}

# case $? in
# 	0 ) echo "未输入" ;;
# 	1 ) echo "输入的是1" ;;
# 	2 ) echo "输入的是2" ;;
# 	3 ) echo "输入的是3" ;;
# 	* ) echo "输入有问题" ;;
# esac

# 二分法查找
# userInput=$1

# arrayOne=(1 3 4 5 6)
# arrayTwo=(2 3 4 5 6)

# arrayThree=(${arrayOne[@]} ${arrayTwo[@]})

# echo ${arrayThree[@]}


# if [[ $((${userInput}-0)) -ge 0 ]]; then
# 	echo "Your input is not a number."
# fi


# if [[ ${userInput} != [0-99] ]]; then
# 	echo "not a number"
# fi

# if [[ ${userInput} == 202[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9] ]]; then
# 	echo "good"
# fi

# if [[ ${userInput} == [0-9]* && $((${userInput}-0)) -ne -1999 ]] 2>/dev/null ; then
# 	echo "good -- ${userInput}"
# else
# 	echo "bad -- ${userInput}"
# fi

# echo $?

# scriptName=$0
# basename ${scriptName}

# userInput=($@)
# i=0

# while [[ -n "$1" ]]; do
#     let i++
#     echo -n "$1"
#     shift
#     [[ ${i} -ne ${#userInput[@]} ]] && echo -n " -> "
# done
# echo

# getopts用法
# opt会保存输入的参数,
# OPTARG保存参数值
# 参数需要一个值,就在参数后面加一个:, 如i:

# echo $$

# while getopts ri: opt 
# do
#     case "${opt}" in
#         i ) echo "install service $OPTARG";;
#         r ) echo "remove al service";;
#         * ) echo "Unknow option: ${opt}";;
#     esac
# done

# var1=$1
# var2=$2
# value=`echo "scale=2; ${var1}+${var2}" |bc`
# echo "value=${value}"

# ls -l ~/Desktop | tail -1 | awk 'NR=2{print}' | awk '{print $3}'
# eval `ls -l ~/Desktop | tail -1 | awk '{printf("who=%s\nsize=%s\nname=%s\n"), $3,$5,$9}'`
# echo "who=${who} size=${size} name=${name}"

# readonly a=10
# # a=5
# echo $a

# a=1
# b=2

# function changeTwoValueFunc() {
# 	c=${a}
# 	a=${b}
# 	b=${c}
# }
# changeTwoValueFunc
# echo "a=$a  b=$b"