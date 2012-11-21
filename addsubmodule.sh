grep url .gitmodules | cut -d'=' -f2 | sed -e 's/^[ ]*//g' | (
while read fn ; do 
reponame="`echo $fn | sed -e 's%github.com/[.a-zA-Z-]*/\([.a-zA-Z-]*\)%\1%g' -e 's/\.git//g' | cut -d'/' -f3`" ;
echo "git submodule add $fn bunndle/$reponame" ;
git submodule add $fn bundle/$reponame ;
done)
