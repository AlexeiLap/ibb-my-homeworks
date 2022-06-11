if (Test-Path -Path $args[0] -PathType leaf )
{
	echo ($args[0] + '- file')	
}
elseif(Test-Path -Path $args[0])
{
	echo ($args[0] + '- dir')	
}
else 
{
	echo ($args[0] + '- not exist')	
}