  
[int]$a = Read-Host 'Dime el primer elemento'
Write-host $a
[int]$b = Read-Host 'Dime el segundo elemento'
Write-host $b
[int]$max = 20
[int]$c = 0

if($a -eq 0) {
           Write-host 'Los numeros introducidos deben ser distintos de 0'
} elseif ($b -eq 0){
    Write-host 'Los numeros introducidos deben ser distintos de 0'
} else {
    if($a -gt $n) {
    $c = $a
    $a = $b
    $b = $c
}
[int]$d = $b
[int]$contador = 0
Write-host 'La sucesion de Fibonacci para los siguientes 20 elementos es: '
     while ($contador -lt $max) {
           $d=$a+$b
           $a = $b
           $b = $d
           $contador = $contador + 1
           Write-host $d

     }
}