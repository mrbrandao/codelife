# Codelife
This is my resume curriculum vitae as a code!  
  
Yes, this is my life Curriculum Vitae entire written in Shell Bash3+  
You can try to refactor this code to use your CV, the code was written using a web page as inspiration.   
So you have style, head, body and foot functions to align and display the screen as pages...  
:smile: Isn't fun!?   
  
![](gif/codelive-06-25.gif?raw=true)

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

### Recording Your Own Demo

Want to create your own GIF demo like the one above? Check out the [Terminalizer Recording Guide](gif/README.md) for detailed instructions on how to record and render terminal sessions using the included configuration files.

### Dependencies
  
  * bash3+
  * openssl
  
I'm using nested for's loops and arrays so it will not work on bash2  
  
As you can see the last page shows that you can build a pdf file pressing "P", there's nothing magic there... 
I'm just converting a previous version of a pdf file in base64 and decode that to build the pdf file.  
I built in that way to use the only bash and have lesser dependencies as possible.   
  
If you have tested pdf file you can see it's braked. That's because, it has personal information  
about me, that I don't want to share... and I broke base64... But you can replace this base64 with your pdf file, but you will need a fill adjusts to make this works...  
  
Find this line:  
```
(tail -n 20 "$0" > "$tmpfile";sed -i '20,$d' "$tmpfile";
```
The number on this tail must be the number of the lines on your base64, subtracted with line number where your base64 starts in the code.  
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
  
_Isca disclaims all copyright interest in the program "isca-cv.sh" (which build curriculum vitae as code) is written by Igor Brandao_  
  
