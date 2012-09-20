files=`ls -d .* | grep '[a-z]' | grep -v 'git'`
for file in $files; do
 cp $file ../$file -r
done
