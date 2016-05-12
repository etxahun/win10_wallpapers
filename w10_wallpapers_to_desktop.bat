@echo off
cls
echo LANA
echo ----
echo.
echo Script para obtener los fondos de escritorio de Windows 10:
echo.
echo   * Copia los wallpapers de tu equipo a una carpeta w10_wallpapers ubicada en el Escritorio
echo.
pause

REM Definimos las rutas
SET orig=%LOCALAPPDATA%\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets
SET dest=%HOMEDRIVE%%HOMEPATH%\Desktop\w10_wallpapers

REM creamos en el escritorio una carpeta llamada "w10_wallpapers"
mkdir %dest%

REM definimos la ruta de los comandos "xcopy" y "explorer"
SET xcopy=%WINDIR%\System32\xcopy.exe /y
SET explorer=%WINDIR%\explorer.exe

REM copiamos los wallpapers de la carpeta "origen" a la carpeta "destino"
%xcopy% %orig% %dest%
echo.
echo Wallpapers guardados en la carpeta "w10_wallpapers" del escritorio...

REM Borrado de los ficheros inferiores a 300KB
pushd %dest%
ren *.* *.jpg
for %%j in (*) do if %%~zj lss 300000 del %%j
popd
echo.
pause

REM Abrimos la carpeta de destino
%explorer% "%dest%"


REM Explicación del código: Parte de borrado

REM pushd %dest%   	<-- Cambiamos al directorio de destino
REM for %%j in (*) 	<-- Para todo fichero existente dentro del directorio...
REM do
REM if %%~zj 		<-- ...si el tamaño del fichero es...
REM lss 10000		<-- ...inferior a 300k (por aquello de descartar las imágenes pequeñas)...
REM del %%j 		<-- borramos los ficheros
REM popd 			<-- volvemos al directorio en el que estabamos (previo al pushd).
