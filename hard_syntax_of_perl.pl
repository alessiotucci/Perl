!#/usr/bin/perl

#declaring variables 
@lines = `perldoc -u -f atan2`;
foreach(@lines)
{
	s/\<([^>]+)>/\U$1/g;
	print;
}
