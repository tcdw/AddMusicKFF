move src\Release\AddmusicK.exe	AddmusicKVS2019.exe
move src\Release\AM4Batch.exe	AM4Batch.exe
move src\Release\AMKGUI.exe		AMKGUI.exe
move src\Release\AMMBatch.exe	AMMBatch.exe
del /q /s *.gitkeep
7z a src.zip src
7z a AMKFF_latest.zip 1DF9 1DFC asm music readme_files samples SPCs stats Addmusic_list.txt "Addmusic_sample groups.txt" "Addmusic_sound effects.txt" addmusicMRemover.pl readme.html src.zip *.exe