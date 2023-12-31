#
#Aliases
#

###ls
if (Test-Path (Get-Command eza -ErrorAction SilentlyContinue).Source) {
	function newls {
	    eza -1 --icons $args
	}

	Remove-Item 'Alias:\ls' -Force;
	New-Alias -Name 'ls' -Value 'newls' -Scope Global

	function ll {
	    eza -lh $args
	}

	function la {
	    eza -ahl $args
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
