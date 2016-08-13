#/bin/sh

# To learn how to control output color, please following articles:
# 1. http://blog.chinaunix.net/uid-1835840-id-2831465.html
# 2. http://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
# 3. http://www.tldp.org/LDP/abs/html/colorizing.html

# Show all the colors of the rainbow, should be run under bash
for STYLE in 0 1 2 3 4 5 6 7; do
  for FG in 30 31 32 33 34 35 36 37; do
    for BG in 40 41 42 43 44 45 46 47; do
      CTRL="\033[${STYLE};${FG};${BG}m"
      echo -en "${CTRL}"
      echo -n "${STYLE};${FG};${BG}"
      echo -en "\033[0m"
    done
    echo
  done
  echo
done

# Reset
echo -e "\033[0m"
