function vs([int]$Year=2015, [string]$Dir) {
    cd "~\Documents\Visual Studio $Year\Projects\$Dir"
}
function vs2015([string]$Dir) {
    vs 2015 $Dir
}
function vs2013([string]$Dir) {
    vs 2013 $Dir
}

# TODO: refactor this into something reusable
function code([string]$Dir) { cd "C:\code\$Dir" }
function kiln([string]$Dir) { code "kiln\$Dir" }
function shorten-path([string] $Path) {
   $loc = $Path.Replace($HOME, '~')
   $loc = $loc.Replace('C:\code\kiln', 'kiln')
   $loc = $loc.Replace('C:\code', 'code')
   # remove prefix for UNC paths
   $loc = $loc -replace '^[^:]+::', ''
   return $loc
}

function VcsStatus {
    $branch = git branch 2>$null |
        ?{ $_ -match '^\*' } |
        %{ $_.Replace('* ', '') }

    if ($branch) {
        return " git $branch"
    }
    $tag = hg par 2>$null |
        ?{ $_ -match '^tag:\s*' } |
        %{ $_ -replace '^tag:\s*(.*)','$1' }
    if($tag) {
        return " hg $tag"
    }
    $changeset = hg par 2>$null |
        ?{ $_ -match '^changeset:' } |
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
    write-host (VcsStatus) -n -f $cvcs
    write-host ' PS>' -n -f $cdelim

    $global:LASTEXITCODE = $realLASTEXITCODE
    return ' '
}
function which($Name) {
    Get-Command $Name | Select-Object -ExpandProperty Definition
}

function elevate($b='powershell') {
    runas /netonly /user:FOGCREEKHQ\jacob $b
}
function ssms {
    elevate 'C:\Program Files (x86)\Microsoft SQL Server\110\Tools\Binn\ManagementStudio\ssms.exe'
}

