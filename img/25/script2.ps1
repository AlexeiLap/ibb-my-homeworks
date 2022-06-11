$files=0
Get-ChildItem -Path $args[0] |
ForEach-Object{
    $_.Name;
	if (Test-Path -Path ($args[0] + $_.Name) -PathType leaf ){
		$files++
	}
}
echo ('Files count: ' + $files)