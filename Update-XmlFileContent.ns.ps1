Function Update-XmlFileContent($fullName, [ScriptBlock] $update){	
	$_ = [xml](Get-Content $fullName)
	& $update
	$_.Save($fullName)
}


Function Overwrite-EnvVariables($env_config, $newValues){
    $newValues.keys | % {
        $key = $_
        $value = $newValues[$key]
        $env_config.variables[$key] = $value
    }
} 

$sourcePath = $packageInfo.sourcePath

$config = @{

    DbServer = ""
    DbName   = ""

}

$root = $MyInvocation.MyCommand.Path | Split-Path -parent
$envName = $args[0]
$versionNumber = $args[1]
$timestamp = [DateTime]::now.ToString("yyyy.MM.dd.HH.mm.ss.FFF")



Update-XmlFileContent "$sourcePath\Web.config" {
            $_.SelectSingleNode("//appSettings/add[@key='DBConnectionString']").value = "Data Source=$($config.DbServer);Initial Catalog=$($config.DbName);Integrated Security=True;" 
}

