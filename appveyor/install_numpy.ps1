#contents of install_numpy.ps1

function main (){
    if (-not(Test-Path "C:\Users\appveyor\Downloads\*.whl")) {
        Write-Host "numpy has not been compiled yet. Starting Long process..."
        Write-Host "pip wheel --wheel-dir=c:\Users\appveyor\Downloads numpy"
        iex "cmd /E:ON /V:ON /C .\\appveyor\\windows_sdk.cmd pip wheel --wheel-dir=c:\\Users\\appveyor\\Downloads numpy"
    } else {
        Write-Host "numpy has already been compiled."
        $numpywheel = Get-ChildItem "C:\Users\appveyor\Downloads\*.whl"
        Write-Host "$numpywheel"
        $numpypath = $numpywheel.FullName
        Write-Host "$numpypath"
        iex "cmd /E:ON /V:ON /C .\\appveyor\\windows_sdk.cmd pip install $numpypath" -Verbose
        iex "cmd /E:ON /V:ON /C .\\appveyor\\windows_sdk.cmd pip list"
    }
}

main