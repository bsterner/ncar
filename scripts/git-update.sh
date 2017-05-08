#!/bin/bash
#help="${help}So let's suppose you're in the common case - you've done some work on your master branch, and you pull from origin's, which also has done some work. After the fetch, things look like this:"
help=""
help="${help}Common case - you've done some work on master branch, you pull from origin, which also has done some work.\n"
help="${help}\n"
help="${help}After the fetch, things look like this:\n "
help="${help}  - o - o - o - H - A - B - C (master)\n"
help="${help}                 \\\n"
help="${help}                  P - Q - R (origin/master)\n"
help="${help} "
help="${help}If you merge at this point (the default behavior of git pull), assuming there aren't any conflicts, you end up with this:\n"
help="${help}  - o - o - o - H - A - B - C - X (master)\n"
help="${help}                 \\             /\n"
help="${help}                  P - Q - R --- (origin/master)\n"
help="${help}\n"
help="${help}If on the other hand you did the appropriate rebase, you'd end up with this:\n"
help="${help}  - o - o - o - H - P - Q - R - A' - B' - C' (master)\n"
help="${help}                            |\n"
help="${help}                            (origin/master)\n"
#help="${help}The content of your work tree should end up the same in both cases; you've just created a different history leading up to it. The rebase rewrites your history, making it look as if you had committed on top of origin's new master branch (R), instead of where you originally committed (H). You should never use the rebase approach if someone else has already pulled from your master branch."
#help="${help}  ~> The content of your work tree should end up the same in both cases; you've just created a different history leading up to it."
#help="${help}  ~> The rebase rewrites your history, making it look as if you had committed on top of origin's new master branch (R)"
#help="${help}Finally, note that you can actually set up git pull for a given branch to use rebase instead of merge by setting the config parameter branch.<name>.rebase to true. You can also do this for a single pull using git pull --rebase."
#help="${help}  ~> You can actually set up git pull for a given branch to use rebase instead of merge by setting the config parameter branch.<name>.rebase to true."
#help="${help}  ~> You can also do this for a single pull using git pull --rebase."

while getopts ":h:" opt; do
  case $opt in
#    a)
#      echo "-a was triggered, Parameter: $OPTARG" >&2
#      ;;
#    \?)
#      echo "Invalid option: -$OPTARG" >&2
#      exit 1
#      ;;
    :)
      #echo "Option -$OPTARG requires an argument." >&2
      echo -e $help
      exit 1
      ;;
  esac
done

git pull --rebase
