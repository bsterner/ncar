# Explanation:
# -H : Print the file name for each match.
# -l : Suppress normal output
fgrep() {
  if [ -z "$1" -o -z "$2" ]; then
    echo "Please provide the file name pattern & value to search for"
  else
    echo "~> find . -maxdepth 4 -name '$1' -exec grep -Hl "$2" {} \;"
    CMD="find . -maxdepth 4 -name '$1' -exec grep -Hl "$2" {} \;`"
    echo $CMD
  fi
}
