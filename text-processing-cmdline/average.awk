/20..$/ {
    sum += $3;
    count ++;
}
END {
    if (count > 0)
	print (2016 - sum/count);
    else
	print "No matches"
}

