index="index.html"

$(printf "ID\tViews\tName\tTitle\tDuration\t\n" >> file.csv)
grep views $index | 
while read match; do 
	((id++))
	$(printf "$id\t" >> file.csv)
	views=`expr "$match" : ".*<li>\(.*\) views"`;
	views=${views//,}
	$(printf "$views\t" >> file.csv)
	name=`expr "$match" : ".*\" >\(.*\)<\/a>"`;
	$(printf "$name\t" >> file.csv)
	title=`expr "$match" : ".*title=\"\(.*\)\" aria-describedby=\""`
	$(printf "$title\t" >> file.csv)
	length=`expr "$match" : ".*Duration: \(.*\)\.</span>"`
	$(printf "$length\t\n" >> file.csv)
done
