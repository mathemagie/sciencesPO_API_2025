#!/bin/bash
set -e
set -u
set -o pipefail

read -p "🎭 Entrez le thème du dialogue : " THEME
THEME=${THEME:-"comment faire une gateau au chocolat"}
echo -e "\n📝 Thème choisi : \033[1;34m$THEME\033[0m\n"
sed "s/\[TOPIC\]/$THEME/g" prompt2.txt > prompt2.temp.txt

cat prompt2.temp.txt | llm > dialogue.txt

echo -e "\n💬 \033[1;33mDialogue généré :\033[0m\n"
# Syntax highlight speakers if possible, else just color Speaker 1/2
awk '
    match($0, /^Speaker [12]:/) {
        s=substr($0, RSTART, RLENGTH)
        rest=substr($0, RLENGTH+2)
        if (s=="Speaker 1:") {
            printf "\033[1;36m%s\033[0m%s\n", s, rest
        } else {
            printf "\033[1;35m%s\033[0m%s\n", s, rest
        }
        next
    }
    {print}
' dialogue.txt

echo -e "\n\033[1;32m--- Fin du dialogue ---\033[0m\n"

python3 ai_studio_code.py
