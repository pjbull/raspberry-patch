# !/bin/bash
while IFS= read -r line
do
myip=$(hostname -I | tr -d [[:space:]])
if [[ $myip != ${line:3} ]]; then
echo "Copying $1 to $line"
scp $1 $line:~/$1
fi
done < "$HOME/machinefile"
