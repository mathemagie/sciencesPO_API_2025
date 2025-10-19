#!/bin/bash
set -e
set -u
set -o pipefail

# What is this block?:
# This activates the Python virtual environment so we use the correct Python version (3.13)
# and the correct packages (google-genai, replicate) that are compatible with each other.

# Activate virtual environment
source path/to/venv/bin/activate

# What is this block?:
# This block defines which language model (LLM) to use when generating dialogue.
# Only one model should be active at a time. The variable is used later by the llm CLI.

# How to select a model:
# Uncomment ONE MODEL assignment line below to choose which model to use.

MODEL="gpt-5-nano-2025-08-07"
MODEL="gemini/gemini-2.5-pro"
MODEL="groq-llama3.1-8b"


read -p "🎭 Entrez le thème du dialogue : " THEME
THEME=${THEME:-"comment faire une gateau au chocolat"}
echo -e "\n📝 Thème choisi : \033[1;34m$THEME\033[0m\n"
sed "s/\[TOPIC\]/$THEME/g" prompt2.txt > prompt2.temp.txt

echo -e "\n💬 \033[1;33mGénération du dialogue...\033[0m\n avec le modèle $MODEL"
cat prompt2.temp.txt | llm -m $MODEL > dialogue.txt
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


echo -e "\n🔊 \033[1;32mGénération audio...\033[0m\n"
python3 ai_studio_code.py
echo -e "\n\033[1;32m--- Fin de la génération audio ---\033[0m\n"

echo -e "\n🎨 \033[1;32mGénération de l'image...\033[0m\n"
python3 generate_image.py
echo -e "\n\033[1;32m--- Fin de la génération de l'image ---\033[0m\n"