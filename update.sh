files=`ls -d .* | grep '[a-z]'`
for file in $files; do
  echo "cp $file ~/$file"
done
