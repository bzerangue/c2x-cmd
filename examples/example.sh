#!/bin/bash
echo "############################################################################################" >>result.log
echo "printing copyright and version info" >result.log
../c2x-cmd -V 2>>result.log

echo "############################################################################################" >>result.log
echo "convert example1.csv to mode1.xml with default separator ;, XML mode 1 , and ANSI/ISO-8859-1 encoding string and aliases" >>result.log
echo "The default filename option used in the cfg file is overwritten by the -t:mode1.xml option ">>result.log
../c2x-cmd -v -cfg:source/example1.cfg -t:results/mode1.xml 2>>result.log

echo "############################################################################################" >>result.log
echo "the same with XML mode 2, dtd validating ,aliases and Pipe (ASCII 124) as separator ">>result.log
../c2x-cmd -v -s:source/example2.csv -t:results/mode2.xml -m:2 -sep::124: -dtd:../extend/mode2-dtd.dtd -alias:aValue=MyValue 2>>result.log

echo "############################################################################################" >>result.log
echo "the same with XML mode 3, record number including, xsd validating and redirection from stdin and stdout" >>result.log
../c2x-cmd -v -s:- -t:- -m:3 -wn -xsd:../extend/mode3-schema.xsd 2>>result.log >results/mode3.xml <source/example1.csv

echo "############################################################################################" >>result.log
echo "the same with XML mode 4 and namespace and aliases" >>result.log
../c2x-cmd -v -s:source/example1.csv -t:results/mode4.xml -m:4 -xmlns:foo="AnyURI" -alias:eRoot=MyRoot,aName=MyName,aValue=MyValue 2>>result.log

echo "############################################################################################" >>result.log
echo "the same with new XML mode 5, suppressing of empty attributes, record number including and CSS including ">>result.log
../c2x-cmd -v -cfg:source/example5.cfg -s:source/example2.csv -t:results/mode5.xml 2>>result.log 

echo "############################################################################################" >>result.log
echo "converting ANSI/ISO-8859-1 source file to UTF-8 target file inkl. given parameters (-cc:i2u)" >>result.log
../c2x-cmd -v -s:source/ex_ansi.csv -t:results/ex_ansi2utf.xml -e:UTF-8 -cc:i2u -m:4 2>>result.log 

echo "############################################################################################" >>result.log
echo "converting UTF-8 source file to ANSI/ISO-8859-1 target file" >>result.log
../c2x-cmd -v -s:source/ex_utf8.csv -t:results/ex_utf2ansi.xml -e:ISO-8859-1 2>>result.log 

echo "############################################################################################" >>result.log
echo "converting ANSI/ISO-8859-1 source file to ANSI/ISO-8859-1 target file" >>result.log
../c2x-cmd -v -s:source/ex_ansi.csv -t:results/ex_ansi2ansi.xml -e:ISO-8859-1 2>>result.log 

echo "############################################################################################" >>result.log
echo "converting UTF-8 source file to UTF-8 target file" >>result.log
../c2x-cmd -v -s:source/ex_utf8.csv -t:results/ex_utf2utf.xml -e:UTF-8 2>>result.log 

more result.log

