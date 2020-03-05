$windows_config_path = "${env:APPDATA}\Code\User"

function Pull {
    Copy-Item settings.json -Destination $windows_config_path
}
function Push {    
    Copy-Item $windows_config_path\settings.json -Destination .
}

function Main {
    param (
        $a
    )
    if ($a.Count -ne 1) {
        Write-Output "脚本只能有一个参数(-h/push/pull)"
        exit
    }
    switch ($a[0]) {
        "pull" {
            Pull
        }
        "push" {
            Push
        }
        "-h" {
            Write-Output @"
脚本需要一个参数
-h显示本帮助信息
pull用dotfiles的配置覆盖本地配置
push用本地配置覆盖dotfiles配置
"@

        }
        default {
            Write-Output "参数必须是(-h/pull/push)"
            exit
        }
    }
}

Main $args
