Boris Bikes
===========
This project serves as an introduction to Object-Oriented Programming (OOP) and the basics of Object-Oriented Design (OOD). We are creating a simple system for managing Boris Bikes in London.

Users can rent bikes from docking stations and return them. The docking station has a fixed capacity and will release working bikes to users if they are available. Users can break bikes. A broken bike will not be released to a user. A van collects broken bikes from the docking station and takes them to a garage to be fixed. The van also picks up working bikes from the garage and returns them to the docking stations. 

Day 1-2
------
Paired with [Jenny](https://github.com/thejennywang) to program our Boris Bikes project from scratch. Learned about Object-Oriented doubling (London style) and mocking (Chicago style), and prepending modules.

Day 3
-------
Revisited solo to tidy up doubles with help of Sandi Metz's excellent video on The Magic Tricks of Testing - Sandi Metz - RailsConf2013 (https://www.youtube.com/watch?v=URSWYvyc42M)

How to run tests
----------
Tested using [rspec](https://github.com/rspec/rspec)

```shell
git clone https://github.com/cmew3/Boris_Bikes_2.git
cd Boris_Bikes_2
gem install rspec
rspec
```