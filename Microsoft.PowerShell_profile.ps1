#
#Aliases
#

###ls
function ls {
    if (Test-Path (Get-Command eza -ErrorAction SilentlyContinue).Source) {
        eza -1 --icons $args
    } else {
        & ls $args
    }
}

if (Test-Path (Get-Command eza -ErrorAction SilentlyContinue).Source) {
	function ll {
	    eza -lh $args
	}

	function la {
	    ll -a $args
	}
}

function tree {
    if (Test-Path (Get-Command eza -ErrorAction SilentlyContinue).Source) {
        ls -T $args
    } else {
        & tree $args
    }
}

if (Test-Path (Get-Command starship -ErrorAction SilentlyContinue).Source) {
	Invoke-Expression (&starship init powershell)
}

if (Test-Path (Get-Command zoxide -ErrorAction SilentlyContinue).Source) {
	Invoke-Expression (& { (zoxide init powershell --cmd cd | Out-String) })
}

if (Test-Path (Get-Command fastfetch -ErrorAction SilentlyContinue).Source) {
    Clear-Host
    fastfetch
}
