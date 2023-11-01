use strict;
use warnings;
use Win32::Process;
use Win32;

my $cmd = 'cmd /c start cmd.exe /K "cd \\\\ && pwd && pause"';
Win32::Process::Create(my $ProcessObj,
		                       "C:\\Windows\\System32\\cmd.exe",
																									                       $cmd,
																																																                       0,
																																																																							                       NORMAL_PRIORITY_CLASS,
																																																																																														                       ".")|| die ErrorReport();

sub ErrorReport{
	    print Win32::FormatMessage( Win32::GetLastError() );
}

