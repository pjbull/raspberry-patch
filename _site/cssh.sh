# !/bin/bash
while IFS= read -r line
do
myip=$(hostname -I|tr -d [[:space:]])
if [[ $myip != ${line:3} ]]; then
echo "Executing Command $1 on $line"
ssh -tt -n $line "$1"
fi
done < "$HOME/machinefile"
