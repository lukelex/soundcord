#SoundCord

A phonetic algorithm to make comparisons by phonetically similar terms easier.

A phonetic algorithm matches two different words with similar pronunciation to the same code, which allows phonetic similarity based word set comparison and indexing.

Often it is quite difficult to find atypical name (or surname) in your records, for example:

— Hey, John, look for Adolf Schwarzenegger.
— Adolf Shwardseneger? There is no such person!

In this case, the use of phonetic algorithms (especially in combination with fuzzy matching algorithms) can significantly simplify the problem.

[![Build Status](https://secure.travis-ci.org/lukasalexandre/soundcord.png)](http://travis-ci.org/lukasalexandre/soundcord)

##Installation
Install it through terminal:

`gem install soundcord`

##Usage
Words can be phonetically transformed:

```ruby
"João".phonetize # "J"
"Maria".phonetize # "MR"
"Helena".phonetize # "LM"
"Walmir".phonetize # "VLM"
```

And also, compared:

```ruby
"Walmir".homophone? "Valmir" # true
```

Array's can be searched for homonyms:

```ruby
collection = ["leonardo", "lucene", "rodrigo", "luciana", "lussene"]
collection.homophones "lucene" # ["lucene", "luciana", "lussene"]
```


##Information

###Language support
SoundCord was idealized to support a wide range of languages. Currently, we are supporting these:

* Brazilian Portuguese.

We are already working on supporting these:

* English;
* Spanish.

###To do:

* Support for collection;
* Support for phrases;
* Alternate languages.

##How to contribute
Please ensure that you provide appropriate test coverage and ensure the documentation is up-to-date. It is encouraged that you perform changes in a clean topic branch rather than a master and that you create a pull request for them. This will facilitate discussion and revision.

Please be clean, keep your commits atomic and with the smallest possible logical change. This will increase the likelihood of your submission to be used.

###Bug reports

If you discover any bugs, feel free to create an issue on GitHub. Please add as much information as possible to help us fixing the possible bug.

https://github.com/lukasalexandre/soundcord/issues

##License
Copyright (c) 2012 Lukas Alexandre. http://www.devinscene.com.br/

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to use, copy and modify copies of the Software, subject
to the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
