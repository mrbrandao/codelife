# Codelife
This is my resume curriculum vitae as a code!  
  
Yes, this is my life Curriculum Vitae entire wrotted in Shell Bash3+  
You can try to refactor this code to use your CV, the code was writted using a web page as inspiration.  
So you have style, head, body and foot functions to align and display the screen as pages...  
:smile: Isn't fun!?   
  
![](gif/isca-cv.gif?raw=true)

### Run

clone this repo:
```
git clone https://github.com/isca0/codelife.git
```
change the directory:
``` 
cd codelife
```

run:
```
./isca-cv.sh
```

Use numbers to paginate and x to quit. You can build a pdf with "P", but keep reading to see more about the pdf file.


### Dependencies
  
  * bash3+
  * openssl
  
Im using nested for's loops and arrays so it will not work on bash2  
  
As you can see the last page shows that you can build a pdf file pressing "P", theres nothing magic there...  
Im just convert a previous version of a pdf file in base64 and decode that to build the pdf file.  
I builded in that way to use only bash and have lesser dependencies as possible.  
  
If you have tested pdf file you can see it's braked. Thats because, it has personal information  
about me, that i don't want share... and i broke base64... But you can replace this base64 with your pdf file, but you will need a fill adjusts to make this works...  
  
Find this line:  
```
(tail -n 20 "$0" > "$tmpfile";sed -i '20,$d' "$tmpfile";
```
The number on this tail must be the number of the lines on your base64, substracted with line number where your base64 starts in the code.  
Eg:  
  
If the line of your base64 starts on line 349 and your base64 has the total of 1700 lines, the tail  
must be:  
  
```
( 1700 - 349 ) 
== 1351
```

So the tail must be:

```
(tail -n 1351 "$0" > "$tmpfile";sed -i '1351,$d' "$tmpfile";
```
  
  
Hope you enjoy! :smiley:
  
_Isca disclaims all copyright interest in the program “isca-cv.sh” (which build curriculum vitae as code) is written by Igor Brandao_  
  
