#!/bin/env sh

function create() {
    [ $# -eq "6" ] || { echo "script expected 3 inputs but received $#";
      echo "";
      echo "usage:";
      echo "  Input Param1: GitHub user name";
      echo "  Input Param2: GitHub password";
      echo "  Input Param3: Project name";
      echo "  Input Param4: Project path";
      echo "  Input Param5: GitHub nick name"
      echo "  Input Param6: GitHub repo [private | public]"
      echo "sample input:";
      echo "";
      echo '  create "GIT_LOGIN_USER_NAME" "PASS_WORD" "test" "D:/windows/project/path" "ecevinoth" "public"';
      return 1
    };
    export user_name=${1}
    export password=${2}
    export proj_name=${3}
    export proj_path=` echo "${4}" | sed -e 's,\\\,\/,g'`
    export user_nick_name=${5}
    export private_bool=${6}
    python create.py "${user_name}" "${password}" "${proj_name}" "${proj_path}" "${private_bool}"

    cd "${proj_path}"/"${proj_name}"
    git init
#    git remote add origin git@github.com:ecevinoth/$1.git
    git remote add origin "https://github.com/${user_nick_name}/${proj_name}.git"
    git remote -v
    touch README.md
    echo "# Project Title" > README.md
    git add .
    git commit -m "added : Initial commit :smile:"
    git push -u origin master
#    code .
}