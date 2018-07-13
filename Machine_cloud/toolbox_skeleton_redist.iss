;##############################################################################################################
; Inno Setup Install script for Toolbox_skeleton
; http://www.jrsoftware.org/isinfo.php
; This file is released under the 3-clause BSD license. See COPYING-BSD.
;##############################################################################################################
; modify this path where is toolbox_skeleton directory
#define BinariesSourcePath "../Machine_Cloud"
;
#define Toolbox_skeleton_version "0.1.0"
#define CurrentYear "2018"
#define Toolbox_skeletonDirFilename "machine_cloud"
;##############################################################################################################
[Setup]
; Debut Données de base à renseigner suivant version
SourceDir={#BinariesSourcePath}
AppName=machine_cloud
AppVerName=machine_cloud version 0.1
DefaultDirName={pf}\{#Toolbox_skeletonDirFilename}
InfoAfterfile=readme.txt
LicenseFile=license.txt
WindowVisible=true
AppPublisher=Scilab
BackColorDirection=lefttoright
AppCopyright=Copyright © {#CurrentYear}
Compression=lzma/max
InternalCompressLevel=normal
SolidCompression=true
VersionInfoVersion={#Toolbox_skeleton_version}
VersionInfoCompany=Scilab
;##############################################################################################################
[Files]
; Add here files that you want to add
Source: loader.sce; DestDir: {app}
Source: etc\toolbox_skeleton.quit; DestDir: {app}\etc
Source: etc\toolbox_skeleton.start; DestDir: {app}\etc
Source: macros\buildmacros.sce; DestDir: {app}\macros
Source: macros\lib; DestDir: {app}\macros
Source: macros\names; DestDir: {app}\macros
Source: macros\*.sci; DestDir: {app}\macros
Source: macros\*.bin; DestDir: {app}\macros
Source: tests\*.*; DestDir: {app}\tests; Flags: recursesubdirs;
Source: demos\*.*; DestDir: {app}\locales; Flags: recursesubdirs
;
;##############################################################################################################
