#!/bin/bash

ans="/tmp/$$-ans"
result="/tmp/$$-result"
error="/tmp/$$-error"

# 異常系
### 引数が2個以外の場合
echo "input 2 arguments" > ${ans}
./gcd.sh 2> ${result}
diff ${ans} ${result} || echo "error in 1-1" >> ${error}

./gcd.sh 1 2> ${result}
diff ${ans} ${result} || echo "error in 1-2" >> ${error}

./gcd.sh 1 2 3 2> ${result}
diff ${ans} ${result} || echo "error in 1-3" >> ${error}

### 引数に自然数以外が含まれる場合
echo "input natural number" > ${ans}
./gcd.sh a b 2> ${result}
diff ${ans} ${result} || echo "error in 2-1" >> ${error}

./gcd.sh 1 0 2> ${result}
diff ${ans} ${result} || echo "error in 2-2" >> ${error}

./gcd.sh 1 -1 2> ${result}
diff ${ans} ${result} || echo "error in 2-3" >> ${error}

./gcd.sh 1 1.11111 2> ${result}
diff ${ans} ${result} || echo "error in 2-4" >> ${error}

# 正常系
### 引数に2と4を指定した場合
echo 2 > ${ans}
./gcd.sh 2 4 > ${result}
diff ${ans} ${result} || echo "error in 3-1" >> ${error}

### 引数に81と30を指定した場合
echo 3 > ${ans}
./gcd.sh 81 30 > ${result}
diff ${ans} ${result} || echo "error in 3-2" >> ${error}

### 引数に1649と221を指定した場合
echo 17 > ${ans}
./gcd.sh 1649 221 > ${result}
diff ${ans} ${result} || echo "error in 3-3" >> ${error}

if [ -f ${error} ]; then
  cat ${error}
  rm /tmp/$$-*
  exit 1
fi

rm /tmp/$$-*
