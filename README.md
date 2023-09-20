# Simple PTT

A simple online forum made with RoR

## [Live Demo](https://simple-ptt-3ffe753ff50b.herokuapp.com/)

![Demo](https://github.com/rubychi/simple-ptt/assets/18576075/065cfbae-1330-446b-ba49-8a4aee308513)

## Getting Started

Follow the instructions below to set up the environment and run this project on your local machine

### Prerequisites

* Ruby v3.0.5
* Node v15.13.0
* PostgreSQL 15.4

### Installation

1. Download ZIP or clone this repo
```
> https://github.com/rubychi/simple-ptt.git
```

2. Install dependencies via bundle and npm
```
> bundle install
> npm install
```

3. Start a PostgreSQL server

*Start commend depends on the OS. For instance, on macOS:*
```
> brew services start postgresql@15
```

4. Setup and Seeding the Database
```
> bin/rake db:setup
```

### Running the app

Start app in the development mode on http://localhost:3000
```
> bin/rails s
```
