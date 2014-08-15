get-host

write-host "To test Yansen's story."

if (-not (test-path c:\tmp\test.txt)) {
    write-host "test2.txt says: no such file."
    exit -1

}
else {
   write-host "test2.txt says: test.txt is there."
   exit 0
}


