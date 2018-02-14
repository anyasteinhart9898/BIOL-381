# use of literal searches 

- "escape" a metacharacter with a slash 

###Wild cards

. any character or space other than an end of line 

  ```R
  `\w` A Single word character [letter, number, etc]
  ```

\d is a single number character [0-9]
`\t` a single table space
`\s` a single space, tab ot line break
\n a single line break (\r)

command z- "undo"

### use the \s and nothing in replace will bring text lines together

#### Quantifiers

`\w+` one or more consectutive word characters 

`\w*` zero or more consectutive word characters

`\w{3}` to find exactly three consecutive characters in a row 

`\w{3,}` find three or more consective word characters 

`\w{3,5}` find 3, 4 or 5 consect. word characters 

.* take everything else to the line break. 

#### Using a zero or more * quantifier 

### using .* for "all the rest " in a line 

#### Use () to "capture" elements of the text for replacement 

#### Specify consecutive capture elements with `\1` , `\2` , etc in the replacement string 

#### in replacement string, mix captured text with literal text 

#### Dealing with genus and species name 

### Create custom character sets 

`\[A,C,T,G]` Find a single nuceotide 

`\[A,C,T,G]+`  Finding the sequence string of nucleotides

`[^A,C,T,G]+` find a string that is NOT a sequence 



####R package `stringer()` 