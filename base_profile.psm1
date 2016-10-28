function vs([int]$year=2013, [string]$dir) {
    cd "~\Documents\Visual Studio $year\Projects\$dir"
}
function vs2013([string]$dir) {
    vs 2013 $dir
}

# TODO: refactor this into something reusable
function code([string]$dir) { cd "C:\code\$dir" }
function kiln([string]$dir) { code "kiln\$dir" }
function shorten-path([string] $path) {
   $loc = $path.Replace($HOME, '~')
   $loc = $loc.Replace("C:\code\kiln", "kiln")
   $loc = $loc.Replace('C:\code', 'code')
   # remove prefix for UNC paths
   $loc = $loc -replace '^[^:]+::', ''
   return $loc
}

function VcsStatus {
    $branch = git branch 2>$null |
        ?{ $_ -match "^\*" } |
        %{ $_.Replace("* ", "") }

    if ($branch) {
        return " git $branch"
    }
    $tag = hg par 2>$null |
        ?{ $_ -match "^tag:\s*" } |
        %{ $_ -replace '^tag:\s*(.*)','$1' }
    if($tag) {
        return " hg $tag"
    }
    $changeset = hg par 2>$null |
        ?{ $_ -match "^changeset:" } |
        %{ $_ -replace '^changeset:\s*(.*)','$1' }
    if($changeset) {
        return " hg $changeset"
    }
}

function prompt {
    $realLASTEXITCODE = $global:LASTEXITCODE
    # our theme
    $cdelim = [ConsoleColor]::DarkCyan
    $chost = [ConsoleColor]::Green
    $cloc = [ConsoleColor]::Cyan
    $cvcs = [ConsoleColor]::Red

    write-host "$env:username@$([net.dns]::GetHostName())" -n -f $chost
    write-host " $(shorten-path (pwd).Path)" -n -f $cloc
    write-host "$(VcsStatus)" -n -f $cvcs
    write-host ' PS>' -n -f $cdelim

    $global:LASTEXITCODE = $realLASTEXITCODE
    return ' '
}
function which($name) {
    Get-Command $name | Select-Object -ExpandProperty Definition
}

function elevate($b='powershell') {
    runas /netonly /user:FOGCREEKHQ\jacob $b
}
function ssms {
    elevate 'C:\Program Files (x86)\Microsoft SQL Server\110\Tools\Binn\ManagementStudio\ssms.exe'
}

