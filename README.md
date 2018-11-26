Upwork test case by Javier Franco
=================

Test case for search profile on the Upwork site.

Used tools:

Ruby

Selenium


Test cases
-------------

Search a keyword from the home page and validate the profiles in the results contain the keyword on its attributes(name, title, description, skills).

Select a random profile from the result page, and validate the info on the result page and on the profile page match.


Set keyword
-------------

To define the keyword to be searched, set the word on the file test.rb line 16.

@keyword = "qa"

Set browser
--------------

To change the browser for the test execution, change the name on the file env.rb line 11.

BROWSER = :firefox

BROWSER = :chrome

